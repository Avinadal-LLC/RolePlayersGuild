﻿<%@ Page Title="RPG: View Thread" Language="C#" MasterPageFile="~/templates/2-Col With Authentication.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RolePlayersGuild.Mailbox.ViewMessages.Default" %>

<%@ MasterType VirtualPath="~/templates/2-Col With Authentication.master" %>
<%@ Register Src="~/templates/controls/UserNav.ascx" TagPrefix="uc1" TagName="UserNav" %>
<%@ Register Src="~/templates/controls/ViewThread.ascx" TagPrefix="uc1" TagName="ViewThread" %>
<%@ Register Src="~/templates/controls/EditThread.ascx" TagPrefix="uc1" TagName="EditThread" %>



<asp:Content ID="Content1" ContentPlaceHolderID="cphLeftCol" runat="server">
    <uc1:UserNav runat="server" ID="UserNav" CurrentParent="Mailbox" />
    <div runat="server" id="divThreadAd">
        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <!-- ThreadsAd -->
        <ins class="adsbygoogle"
            style="display: block"
            data-ad-client="ca-pub-1247828126747788"
            data-ad-slot="7028871313"
            data-ad-format="auto"></ins>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({});
        </script>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphRightCol" runat="server">
    <uc1:ViewThread runat="server" ID="ViewThread" />
</asp:Content>