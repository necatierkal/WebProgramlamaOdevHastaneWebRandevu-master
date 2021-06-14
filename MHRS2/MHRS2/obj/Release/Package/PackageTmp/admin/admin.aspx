<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="MHRS2.admin.admin1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div id="sonuc" style="color:red;font-size:18px;font-weight:bold;border:1px solid #808080;padding:10px;"></div>
    <div class="col-md-6">
        <h4>Hastane Ekle</h4>
    <form id="" onsubmit="return false">
        <table>
        <tr>
            <td style="width: 71px">Şehir</td>
              <td style="width: 591px">  <select name="sehir"  class="form-control"> </select> </td>
        </tr> 
       <tr>
          <td style="width: 71px">İlçe</td>
          <td style="width: 591px"><select  class="form-control" name="ilce"><option>İlçe Seçiniz</option> </select>   </td>
        </tr>
        <tr>
          <td style="width: 71px">Hastane Adı</td>
          <td style="width: 591px"><input  class="form-control" type="text" name="hastaneAdi"/>   </td>
        </tr>
         <tr>
          <td style="width: 71px"></td>
          <td style="width: 591px"><button class="btn btn-xs btn-primary" id="btnHastaneEkle">Ekle</button>  </td>
        </tr>
      </table>
    </form>
</div>
    <div class="col-md-6">
    <h4>Hastaneye Klinik Ekle</h4>
       <form id="">
        <table>
        <tr>
            <td style="width: 71px">Hastane Listesi</td>
            <td style="width: 591px">  <select name="hastaneList" class="form-control"><option>H->doldur</option></select> <button class="btn btn-xs  btn-warning" id="hastaneDoldur" >Doldur</button></td>
        </tr> 
       <tr>
          <td style="width: 71px">Klinik Adı Adı</td>
          <td style="width: 591px"><input type="text" class="form-control" name="klinikAdi"/>   </td>
        </tr>
         <tr>
          <td style="width: 71px"></td>
          <td style="width: 591px"><button class="btn btn-xs btn-primary" id="btnKlinikEkle" >Ekle</button>  </td>
        </tr>
      </table>
    </form>
    </div>
     <div class="col-md-6">
<div class="clear"></div>
    <h4>Kliniğe Hekim Ekle</h4>
       <form id="">
        <table>
        <tr>
            <td style="width: 71px">Klinik Listesi</td>
            <td style="width: 591px">  <select name="klinikList" class="form-control"><option>K->doldur</option></select> <button class="btn btn-xs btn-warning" id="klinikDoldur" >Doldur</button></td>
        </tr> 
            <tr>
                <td>Hekim Adı</td>
                 <td><input class="form-control" type="text" id="hekimAdi" /></td>
            </tr>
        <tr>
          <td style="width: 71px"></td>
          <td style="width: 591px"><button class="btn btn-xs btn-primary" id="btnHekimEkle" >Ekle</button>  </td>
        </tr>
      </table>
    </form>
    </div>

   <div class="clear"></div>
    <script src="admin.js?v=2"></script>    
</asp:Content>
