﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RolePlayersGuild.MyCharacters.EditCharacter
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Init()
        {
            var EditMode = Request.QueryString["Mode"];

            if (EditMode != null)
            {
                switch (EditMode)
                {
                    case "New":
                        break;
                    case "Edit":
                        break;
                    default:
                        Response.Redirect("/");
                        break;
                }
                EditCharacter.ScreenStatus = EditMode;
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.PnlLeftCol.CssClass = "col-sm-3 col-xl-2";
            Master.PnlRightCol.CssClass = "col-sm-9 col-xl-10";
            if (Session["HasCharacters"] == null)
            { pnlWelcomeMessage.Visible = true; }
        }
    }
}