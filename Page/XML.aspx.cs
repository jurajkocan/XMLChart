using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebApplication2.Page
{
    public partial class XML : System.Web.UI.Page
    {        
        protected void Page_Load(object sender, EventArgs e)
        {
            btnWizardFinished.Attributes["graph-stat"] = "false";
            
        }

        protected void btnWizardFinished_Click(Object sender, EventArgs e){
            string hiddenAspFieldValueX = "";
            string hiddenAspFieldValueY = "";
            
            string axisValueX = hiddenFieldChartInfoX.Value;
            string axisValueY = hiddenFieldChartInfoY.Value;

            Controllers.XMLParser xmlParser = new Controllers.XMLParser(inputXMLUrl.Value, axisValueX, axisValueY);

            List<Controllers.Pair<string, string>> dropdownValues = xmlParser.getValuesAllSelectedNodes();
            foreach (Controllers.Pair<string,string> pair in dropdownValues)
            {
                hiddenAspFieldValueX += pair.First + ';';
                hiddenAspFieldValueY += pair.Second+ ';';
            }

            hiddenFieldChartInfoX.Value = hiddenAspFieldValueX;
            hiddenFieldChartInfoY.Value = hiddenAspFieldValueY;
            btnWizardFinished.Attributes["graph-stat"] = "true";


        }

        protected void btnSubmitXML_Click(Object sender, EventArgs e)
        {            
            string xmlUrlAdress = inputXMLUrl.Value.Trim();
            Controllers.XMLParser xmlParser = new Controllers.XMLParser(xmlUrlAdress);
            
            if (xmlParser.isUrlCorrect) {                
                labelWrongUrl.Attributes.CssStyle.Add("display", "none");
                List<string>[] nodes = xmlParser.getLastNodes();

                demoShowSelectedXaxis.Items.Clear();
                demoShowSelectedYaxis.Items.Clear();


                ListItem dropDownOption;
                for (int i = 0; i < nodes[0].Count; i++)
                {
                    dropDownOption = new ListItem(nodes[0][i],nodes[0][i]);
                    dropDownOption.Attributes.Add("value", nodes[1][i]);
                    dropDownOption.Attributes.Add("data-imagesrc", "../../Scripts/Static_Content/images/icoXML.jpg");
                    dropDownOption.Attributes.Add("data-description", nodes[1][i]);

                    demoShowSelectedXaxis.Items.Add(dropDownOption);
                    demoShowSelectedYaxis.Items.Add(dropDownOption);
                }

                    //since dropdowns are full
                    divConfigureXml.Attributes.CssStyle.Add("display", "block");
                    
            }
            else
            {
                labelWrongUrl.Attributes.CssStyle.Add("display", "block");
                divConfigureXml.Attributes.CssStyle.Add("display", "none");

            }
        }
    }
}