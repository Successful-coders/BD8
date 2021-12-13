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
        protected void Button2_Click(object sender, EventArgs e)
        {
            //создание объекта подключения и ODBC-источник
            OdbcConnection connection = new OdbcConnection(@"Dsn=PostgreSQL30");
            connection.Open();

            //текст запроса
            string request = "insert into pmib8502.r values('E'||trim(to_char(nextval('pmib8502.table_izd_seq'),'99999')), ?, ?, ?, ?, ?, ?, ?, ?)";

            //"create sequence table_izd_seq increment by 1 start with 14;
            using (OdbcCommand command = new OdbcCommand(request, connection))
            {
                string zak = DropDownList1.SelectedValue;
                string izd = RadioButtonList2.SelectedValue;
                string cl = RadioButtonList3.SelectedValue;
                string date_order = TextBox1.Text;
                string date_pay = TextBox2.Text;
                string date_shiping = TextBox3.Text;
                string kol = TextBox4.Text;
                string cost = TextBox5.Text;

                //параметры
                command.Parameters.AddWithValue("@zak", zak);
                command.Parameters.AddWithValue("@izd", izd);
                command.Parameters.AddWithValue("@cl", cl);
                command.Parameters.AddWithValue("@date_order", date_order);
                command.Parameters.AddWithValue("@date_pay", date_pay);
                command.Parameters.AddWithValue("@date_shiping", date_shiping);
                command.Parameters.AddWithValue("@kol", Int32.Parse(kol));
                command.Parameters.AddWithValue("@cost", Int32.Parse(cost));
                //объявление объекта транзакции
                OdbcTransaction tx = null;

                try
                {
                    //созданиетранзакции и извлечение объекта транзакции из объекта подключения
                    tx = connection.BeginTransaction();
                    //включаем объект SQL-команды в транзакцию
                    command.Transaction = tx;
                    // выполняем SQL- команду и получаем количество обработанных записей
                    int i = command.ExecuteNonQuery();
                    //подтверждение транзакции
                    tx.Commit();
                    //сообщение об успешности транзакции и количестве обработанных записей
                    Label1.Text = "2 Транзакция успешно завершена. Записей обработано: " + i.ToString() + ".\n";
                    if (i == 0) Label1.Text += "Запрос - пуст.\n";
                }
                catch (Exception exec)
                {
                    //сообщение об ошибке + текст ошибки
                    Label1.Text = "2 Транзакция не завершена. Ошибка: " + exec.Message + ".\n";
                    //откат транзакции
                    tx.Rollback();
                }
            }
        }
    }
}