using Microsoft.SharePoint.Client;
using OfficeDevPnP.Core.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security;
using System.Text;
using System.Threading.Tasks;

namespace CAPnPModernSiteProvisioning
{
    class Program
    {
        static void Main(string[] args)
        {
            using (ClientContext ctx = new ClientContext("https://rr87.sharepoint.com/sites/IT"))
            {
                Console.Write("Password: ");
                SecureString passWord = GetPassword();
                Console.WriteLine();

                ctx.Credentials = new SharePointOnlineCredentials("xxxx@xxx.onmicrosoft.com", passWord);

                //CreatePage(ctx, "Test page.aspx");
                //ModifyPage(ctx, "Test page.aspx");
                //AddDefaultWebPart(ctx, "Test page.aspx");

                var page = ctx.Web.AddClientSidePage("Test page.aspx", true);
                page.AddSection(CanvasSectionTemplate.ThreeColumn, 5);
                page.AddSection(CanvasSectionTemplate.TwoColumn, 10);
                page.Save();
            }

            Console.WriteLine("Konec ...");
            Console.ReadLine();
        }

        private static SecureString GetPassword()
        {
            var pwd = new SecureString();
            while (true)
            {
                ConsoleKeyInfo i = Console.ReadKey(true);
                if (i.Key == ConsoleKey.Enter)
                {
                    break;
                }
                else if (i.Key == ConsoleKey.Backspace)
                {
                    if (pwd.Length > 0)
                    {
                        pwd.RemoveAt(pwd.Length - 1);
                        Console.Write("\b \b");
                    }
                }
                else
                {
                    pwd.AppendChar(i.KeyChar);
                    Console.Write("*");
                }
            }
            return pwd;
        }

        private static void CreatePage(ClientContext siteContext, string pageName)
        {
            ClientSidePage page = new ClientSidePage(siteContext);

            ClientSideText txt1 = new ClientSideText() { Text = "Hello world!" };
            page.AddControl(txt1, 0);

            page.Save(pageName);

            Console.WriteLine("Page successfully created.");
        }

        private static void ModifyPage(ClientContext siteContext, string pageName)
        {
            ClientSidePage page = ClientSidePage.Load(siteContext, pageName);

            ClientSideText txt1 = new ClientSideText() { Text = "Hello world 2!" };
            page.AddControl(txt1, 0);

            page.Save(pageName);

            Console.WriteLine("Page successfully modified.");
        }

        private static void AddDefaultWebPart(ClientContext siteContext, string pageName)
        {
            // add video embed web part..
            ClientSidePage page = new ClientSidePage(siteContext);
            ClientSideWebPart videoEmbedWp = page.InstantiateDefaultWebPart(DefaultClientSideWebParts.VideoEmbed);
            videoEmbedWp.Properties["videoSource"] = "[specify-url-here]";
            videoEmbedWp.Properties["captionText"] = "[specify-title-here]";
            videoEmbedWp.Properties["showInfo"] = false;
            videoEmbedWp.Properties["embedCode"] = "<iframe width=853 height=480 src='[specify-url-here]' allowfullscreen></iframe>";
            videoEmbedWp.Title = "Associated video";
            page.AddControl(videoEmbedWp);

            // add Yammer embed web part..
            ClientSideWebPart yammerEmbedWp = page.InstantiateDefaultWebPart(DefaultClientSideWebParts.YammerEmbed);
            yammerEmbedWp.Properties["yammerFeedURL"] = "[specify-url-here]";
            yammerEmbedWp.Title = "Associated Yammer group";
            page.AddControl(yammerEmbedWp);

            page.Save(pageName);

            Console.WriteLine("Default Web Part added.");
        }

        private static void AddCustomSPFxWebPart(ClientContext siteContext, string wpName, string pageName, int wpOrder)
        {
            ClientSidePage page = new ClientSidePage(siteContext);

            var components = page.AvailableClientSideComponents();

            var webPartToAdd = components.Where(wp => wp.ComponentType == 1 && wp.Name == wpName).FirstOrDefault();
            if (webPartToAdd != null)
            {
                ClientSideWebPart clientWp = new ClientSideWebPart(webPartToAdd) { Order = wpOrder };
                page.AddControl(clientWp);
            }

            page.Save(pageName);
        }
    }
}
