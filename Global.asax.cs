﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace de1
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-3.6.0.min.js",  // Đường dẫn đến file jQuery trong dự án của bạn
                DebugPath = "~/Scripts/jquery-3.6.0.js",
                CdnPath = "https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.min.js",
                CdnDebugPath = "https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.js"
            });
        }

    }
}