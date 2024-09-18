﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditArticle.ascx.cs" Inherits="RolePlayersGuild.templates.controls.EditArticle" ClientIDMode="Static" %>
<script src="/js/jquery.are-you-sure.js"></script>
<script src="/js/ays-beforeunload-shim.js"></script>
<script>
    $(function () {
        $('#form1').areYouSure();
    });

</script>
<asp:Panel ID="pnlMessage" runat="server" ViewStateMode="Disabled" Visible="false" role="alert">
    <asp:Literal ID="litMessage" runat="server" ViewStateMode="Disabled"></asp:Literal>
</asp:Panel>
<h1>
    <asp:Literal ID="litTitle" runat="server"></asp:Literal></h1>
<div class="ButtonPanel clearfix">
    <div class="col-xl-3 col-sm-4 col-xs-12">
        <a class="btn btn-default" href="/My-Articles/">Back to My Articles</a>
    </div>
    <div class="col-xl-3 col-sm-4 col-xs-12">
    </div>
    <div class="col-xl-3 col-sm-4 col-xs-12 col-xl-offset-3">
        <asp:HyperLink ID="lnkViewArticle" runat="server" CssClass="btn btn-default" NavigateUrl="#" Target="_blank">View Article</asp:HyperLink>
    </div>
</div>

<div class="form-group">
    <label for="txtArticleTitle">Article Title</label>
    <asp:TextBox ID="txtArticleTitle" runat="server" CssClass="form-control" ClientIDMode="Static" placeholder="(Required)" required autofocus MaxLength="50"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvArticleTitle" SetFocusOnError="true" runat="server" ErrorMessage="You must enter a name for the Article." ControlToValidate="txtArticleTitle" Display="Dynamic" CssClass="label label-danger"></asp:RequiredFieldValidator>
</div>

<div class="form-group">
    <label for="txtArticleDescription">Article Content</label>
    <asp:TextBox ID="txtArticleContent" runat="server" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control" ValidateRequestMode="Disabled" Rows="12"></asp:TextBox>
</div>
<div class="form-group">
    <label for="ddlCategory">Category</label>
    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" DataSourceID="sdsCategories" DataTextField="CategoryName" DataValueField="CategoryID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="sdsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:RolePlayersGuild.Properties.Settings.rpgDBConn %>" SelectCommand="SELECT * FROM [Article_Categories] ORDER BY [CategoryName]"></asp:SqlDataSource>
</div>
<div class="form-group">
    <label for="ddlUniverse">Universe</label>
    <asp:DropDownList ID="ddlUniverse" runat="server" CssClass="form-control" DataSourceID="sdsUniverses" DataTextField="UniverseName" DataValueField="UniverseID" AppendDataBoundItems="true">
        <asp:ListItem Value="0" Text="No Universe Selected"></asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="sdsUniverses" runat="server" ConnectionString="<%$ ConnectionStrings:RolePlayersGuild.Properties.Settings.rpgDBConn %>" SelectCommand="SELECT [UniverseID], [UniverseName]  FROM [Universes] Where UniverseOwnerID = @WriterID ORDER BY [UniverseName]">
        <SelectParameters>
            <asp:SessionParameter Type="Int32" SessionField="UserID" Name="WriterID" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>

<div class="form-group">
    <label for="ddlRating">Content Rating</label>
    <div class="input-group">
        <asp:DropDownList ID="ddlRating" runat="server" CssClass="form-control">
            <asp:ListItem Text="Teen" Value="1"></asp:ListItem>
            <asp:ListItem Text="Mature" Value="2"></asp:ListItem>
        </asp:DropDownList>
        <span class="input-group-btn">
            <a href="#" data-toggle="modal" data-target="#RatingDescription" class="btn btn-info" tabindex="-1"><span class="glyphicon glyphicon-question-sign"></span></a>
        </span>
    </div>
</div>
<div class="form-group clearfix">
    <label for="cblGenres">Genres</label>
    <div class="FancyCheckList GenreList">
        <asp:CheckBoxList ID="cblGenres" runat="server" RepeatLayout="UnorderedList" DataSourceID="sdsGenres" DataTextField="GenreName" DataValueField="GenreID" CssClass="FancyCheck" OnDataBound="cblGenres_DataBound"></asp:CheckBoxList>
        <asp:SqlDataSource ID="sdsGenres" runat="server" ConnectionString="<%$ ConnectionStrings:RolePlayersGuild.Properties.Settings.rpgDBConn %>" SelectCommand="SELECT * FROM [Genres] ORDER BY [GenreName]"></asp:SqlDataSource>
    </div>
</div>
<div class="checkbox FancyCheck">
    <asp:CheckBox ID="chkPrivateArticle" ClientIDMode="Static" runat="server" Text="This Article should not be linked to my Writer Profile." />
</div>
<div class="checkbox FancyCheck">
    <asp:CheckBox ID="chkDisableLinkify" ClientIDMode="Static" runat="server" Text="Disable auto-spacing and linking." />
</div>

<div class="ButtonPanel clearfix">
    <div class="col-xl-3 col-sm-4 col-xs-12">
        <asp:HyperLink ID="lnkDeleteArticle" runat="server" Text="Delete Article" CssClass="btn btn-danger" data-toggle="modal" data-target="#DeleteArticleModal" />
    </div>
    <div class="col-xl-3 col-sm-4 col-xs-12">
    </div>
    <div class="col-xl-3 col-sm-4 col-xs-12 col-xl-offset-3">
        <asp:Button ID="btnCreateArticle" runat="server" Text="Save Article" CssClass="btn btn-primary" OnClick="btnCreateArticle_Click" />
    </div>
</div>

<!-- Modals -->

<div class="modal fade" id="DeleteArticleModal" tabindex="-1" role="dialog" aria-labelledby="DeleteArticleLabel" runat="server" clientidmode="Static">
    <div class="modal-dialog" role="document">
        <div class="modal-content alert-danger">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="DeleteArticleLabel">Are you sure?</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this Article?</p>
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnDeleteArticle" runat="server" Text="Delete Article" CssClass="btn btn-danger" OnClick="btnDeleteArticle_Click" />

                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="RatingDescription" tabindex="-1" role="dialog" aria-labelledby="RatingLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="RatingLabel">Content Ratings</h4>
            </div>
            <div class="modal-body">
                <p>Content ratings can be defined as so:</p>
                <ul>
                    <li><strong>Teen:</strong>
                        Content is generally suitable for ages 13 and up. May contain violence, suggestive themes, crude humor, minimal blood, simulated gambling and/or infrequent use of strong language.
                    </li>
                    <li><strong>Mature:</strong>
                        Content is generally suitable for ages 17 and up. May contain intense violence, blood and gore, sexual content and/or strong language.
                    </li>
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
