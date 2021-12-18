using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace BD_BR5
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            //создание объекта подключения и ODBC-источник
            OdbcConnection connection = new OdbcConnection(@"Dsn=PostgreSQL30");
            connection.Open();
            //текст запроса
            string seq_req = "select setval('pmib8502.izd_seq', count(*)) from pmib8502.r";
            using (OdbcCommand command = new OdbcCommand(seq_req, connection))
            {
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
                    Label1.Text = "Транзакция успешно завершена. Записей обработано: " + i.ToString() + ".\n";
                    if (i == 0) Label1.Text += "Запрос - пуст.\n";
                }
                catch (Exception exec)
                {
                    //сообщение об ошибке + текст ошибки
                    Label1.Text = "Транзакция не завершена. Ошибка: " + exec.Message + ".\n";
                    //откат транзакции
                    tx.Rollback();
                }

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            //создание объекта подключения и ODBC-источник
            OdbcConnection connection = new OdbcConnection(@"Dsn=PostgreSQL30");
            connection.Open();

            //текст запроса
            string request = "insert into pmib8502.r values('R'||trim(to_char(nextval('pmib8502.izd_seq'),'99999')), ?, ?, ?, ?, ?, ?, ?)";

            
            using (OdbcCommand command = new OdbcCommand(request, connection))
            {
                
                string izd = RadioButtonList2.SelectedValue.Replace(" ", "");
                string cl = RadioButtonList3.SelectedValue.Replace(" ", "");
                string date_order = TextBox1.Text;
                string date_pay = TextBox2.Text;
                string date_shiping = TextBox3.Text;
                string kol = TextBox4.Text;
                string cost = TextBox5.Text;

                //параметр
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
                    Label1.Text = "Транзакция успешно завершена. Записей обработано: " + i.ToString() + ".\n";
                    if (i == 0) Label1.Text += "Запрос - пуст.\n";
                }
                catch (Exception exec)
                {
                    //сообщение об ошибке + текст ошибки
                    Label1.Text = "Транзакция не завершена. Ошибка: " + exec.Message + ".\n";
                    //откат транзакции
                    tx.Rollback();
                }
                
            }
        }
    }
}