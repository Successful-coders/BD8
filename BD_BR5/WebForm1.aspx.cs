using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace BD_BR5
{
    //структура запроса
    public class Struct_query
    {
        public string n_det { get; set; }
        public DateTime date_post { get; set; }
        public int cost { get; set; }

        public Struct_query(string n_det, DateTime date_post, int cost)
        {
            this.n_det = n_det;
            this.date_post = date_post;
            this.cost = cost;
        }
    }

    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //создание объекта подключения и ODBC-источник
            OdbcConnection connection = new OdbcConnection(@"Dsn=PostgreSQL30");
            connection.Open();
            //текст запроса
            string request = "select pmib8502.spj1.n_det, pmib8502.spj1.date_post, pmib8502.spj1.cost " +
                            "from pmib8502.spj1 " +
                            "where pmib8502.spj1.n_izd = ? " +
                            "order by 2 desc " +
                            "limit 1 ";
            //создаем объект запроса
            using (OdbcCommand command = new OdbcCommand(request, connection))
            {
                //изделие, дата
                string izd = RadioButtonList1.SelectedValue;
                //параметры
                command.Parameters.AddWithValue("@izd", izd);

                //объявление объекта транзакции
                OdbcTransaction tr = null;
                try
                {
                    //создание транзакции и извлечение объекта транзакции из объекта подключения
                    tr = connection.BeginTransaction();

                    //объект SQL-команды в транзакцию
                    command.Transaction = tr;
                    //запрос
                    OdbcDataReader reader = command.ExecuteReader();
                    //возвращенный запрос в список
                    List<Struct_query> data = new List<Struct_query>();
                    while (reader.Read())
                        data.Add(new Struct_query((string)reader.GetValue(0),
                                                    (DateTime)reader.GetValue(1),
                                                    (int)reader.GetValue(2)
                                                    ));
                    //закрытие запроса
                    reader.Close();
                    //подтверждение транзакции
                    //tr.Commit();
                    //сообщение об успешности транзакции и количестве обработанных записей
                    //или так data.Count().ToString();
                    int i = command.ExecuteNonQuery();
                    Label1.Text = "Транзакция успешно завершена. Записей обработано: " + i.ToString() + ".\n";
                    if (i == 0) Label1.Text += "Запрос - пуст.\n";
                    //обновить grid с новыми данными
                    GridView1.DataSourceID = null;
                    GridView1.DataSource = data;
                    GridView1.DataBind();
                    tr.Commit();

                }
                catch (Exception exec)
                {
                    //сообщение об ошибке + текст ошибки
                    Label1.Text = "Транзакция не завершена. Ошибка: " + exec.Message + ".\n";
                    //откат транзакции
                    tr.Rollback();
                }
            }
            //закрыть соединение
            connection.Close();

        }
        
    }
}