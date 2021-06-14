<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="iframe.aspx.cs" Inherits="MHRS2.iframe" %>



     <asp:Repeater ID="RepeaterHastaneListele" runat="server">
                                <ItemTemplate>
                                      <a href="#" id="<%#Eval("hastaneID") %>" data-ilce="<%#Eval("hilce") %>" class="list-group-item list-group-item-warning"><%#Eval("hadi") %> </a>
                                </ItemTemplate>
                               
     </asp:Repeater>

<script src="Content/js/jquery.cookie.js"></script>
<script>
    $(".list-group-item").click(function () {
        var hastaneID = $(this).attr("id");
        var ilceID = $(this).attr("data-ilce");
        $.cookie('hastaneID', hastaneID);
        $.cookie('ilceID', ilceID);
       
        $("#wizard").steps("next", true, {
            transitionEffect: "slideLeft"
        });
     

    });

</script>
