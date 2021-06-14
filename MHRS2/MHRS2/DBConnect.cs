using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MHRS2
{
    public class DBConnect
    {
           public SqlConnection baglan()
        {

            SqlConnection baglanti = new SqlConnection("Data Source=DESKTOP-RVHM5KE\\SQLEXPRESS; Initial Catalog=enaproje;Integrated Security=True");
            baglanti.Open();
            return baglanti;
        }

        

        public int cmd(string sorgu)
        {
            SqlConnection baglanti = this.baglan();
            SqlCommand cmd = new SqlCommand(sorgu, baglanti);
            int sonuc = 0;

            try
            {
                sonuc = cmd.ExecuteNonQuery();
            }
            catch (SqlException e)
            {

                throw new Exception(e.Message);
            }
            cmd.Dispose();
            baglanti.Close();
            baglanti.Dispose();
            return sonuc;

        }

        public DataTable GetDataTable(string sorgu)
        {
            SqlConnection baglanti = this.baglan();
            SqlDataAdapter dataAdabter = new SqlDataAdapter(sorgu, baglanti);
            DataTable dt = new DataTable();


            try
            {
                dataAdabter.Fill(dt);
            }
            catch (SqlException e)
            {

                throw new Exception(e.Message);
            }
            dataAdabter.Dispose();
            baglanti.Close();
            baglanti.Dispose();
            return dt;
        }


        public DataRow GetDataRow(string sorgu)
        {
            DataTable dt = GetDataTable(sorgu);
            if (dt.Rows.Count == 0)
            {
                return null;
            }
            else
            {
                return dt.Rows[0];
            }

        }

        public string GetDataCell(string sorgu)
        {
            DataTable dt = GetDataTable(sorgu);
            if (dt.Rows.Count == 0)
                return null;
            else
                return dt.Rows[0][0].ToString();

        }

        

        public bool varmiKayit(string sorgu)
        {
            SqlConnection baglanti = this.baglan();
            SqlCommand cmd = new SqlCommand(sorgu, baglanti);
            int sonuc = 0;

            try
            {
                sonuc = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch (SqlException e)
            {

                throw new Exception(e.Message);
            }
            cmd.Dispose();
            baglanti.Close();
            baglanti.Dispose();
            if (sonuc > 0)
                return true;
            else
                return false;

        }
    }
}
