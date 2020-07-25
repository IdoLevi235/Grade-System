using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Xml.Linq;

namespace DatabaseExample
{
    /// <summary>
    /// Summary description for WebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WebService : System.Web.Services.WebService
    {

        [WebMethod]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]//Specify return format.
        public string GetPrices()
        {
            using (var wc = new WebClient())
            {
                var url = string.Format("https://dev.bestfinex.com/externalservice.asmx/GetTickers");
                var s = wc.DownloadString(url);
                var xdoc = XDocument.Parse(s);
                return xdoc.Root.Value;
            }

        }
    }
}
