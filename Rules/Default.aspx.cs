﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RolePlayersGuild.Rules
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            litRulesContent.Text = DataFunctions.Scalars.GetSingleValue("Select RulesPageContent From General_Settings").ToString();
        }
    }
}