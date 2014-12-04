using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;

namespace WebApplication2.Controllers
{        
    
    public class XMLParser
    {
        private string _xmlUrl;
        private XmlDocument _xDoc = new XmlDocument();
        
        public bool isUrlCorrect;
        
        /// <summary>
        /// Initializes a new instance of System.Controllers.XMLParser
        /// class with some additional functions for work with xml document
        /// </summary>
        /// <param name="urlAdress"></param>
        public XMLParser(string urlAdress) {
            this._xmlUrl = urlAdress;
            this.isUrlCorrect = _isCorrectUrl();            
        }

        /// <summary>
        /// Initiazises a new instance of System.Controllers.XMLParser
        /// class with some additional dunctions dor work with xml document
        /// </summary>
        /// <param name="xAxis"></param>
        /// <param name="yAxis"></param>
        public XMLParser(string urlAdress, string xAxis, string yAxis)
        {
            this._xmlUrl = urlAdress;
            this.isUrlCorrect = _isCorrectUrl();
            this._xAxis = xAxis;
            this._yAxis = yAxis;
        }
        
        /// <summary>
        /// Return array size of 2 where are last nodes from xml document 
        /// </summary>
        /// <returns></returns>
        public List<string>[] getLastNodes() {
            List<string>[] result = new List<string>[0];
            if (isUrlCorrect) {
                result = new List<string>[2];
                
                string nodeValue = "";
                string nodeText;
                List<string> allNodesValue = new List<string>();
                List<string> allNodesText = new List<string>();

                XmlReaderSettings settings = new XmlReaderSettings();
                XmlReader reader = XmlReader.Create(_xmlUrl, settings);
                reader.MoveToContent();

                while (reader.Read())
                {
                    switch (reader.NodeType)
                    {
                        case XmlNodeType.Element:
                            nodeValue = reader.Name;
                            break;
                        case XmlNodeType.Text:
                            if (allNodesValue.Contains(nodeValue))
                            {
                                break;
                            }
                            else
                            {
                                allNodesValue.Add(nodeValue);
                                nodeText = nodeValue + (" :  " + reader.Value);
                                allNodesText.Add(nodeText);
                            }
                            break;
                        case XmlNodeType.CDATA:
                            if (allNodesValue.Contains(nodeValue))
                            {
                                break;
                            }
                            else
                            {
                                allNodesValue.Add(nodeValue);
                                nodeText = nodeValue + (" :  " + reader.Value);
                                allNodesText.Add(nodeText);
                            }
                            break;
                        case XmlNodeType.ProcessingInstruction:

                            break;
                        case XmlNodeType.Comment:

                            break;
                        case XmlNodeType.XmlDeclaration:

                            break;
                        case XmlNodeType.Document:
                            break;
                        case XmlNodeType.DocumentType:

                            break;
                        case XmlNodeType.EntityReference:

                            break;
                        case XmlNodeType.EndElement:

                            break;
                    }
                }
                result[0] = allNodesValue;
                result[1] = allNodesText;
            }
             
            return result;
        }        

        /// <summary>
        /// Return true or false if XDocument can load xml
        /// </summary>
        /// <returns>bool</returns>
        private bool _loadXml(){
            try {
                this._xDoc.Load(this._xmlUrl);                
            }
            catch
            {
                return false;
            }
            return true;
        }
        /// <summary>
        /// Return bool if urlArdess is adress tu xml Document
        /// </summary>
        /// <returns>bool</returns>
        private bool _isCorrectUrl(){
            if (this._xmlUrl.StartsWith("www.") || this._xmlUrl.StartsWith("http://www")) {
                if (this._xmlUrl.EndsWith(".xml")) {
                    try {
                        this._xDoc.Load(this._xmlUrl);
                        return true;
                    }
                    catch
                    {
                        return false;
                    }
                }
                return false;
            }            
            return false;
        }
        
        string _xAxis;
        string _yAxis;

        public List<Pair<string, string>> getValuesAllSelectedNodes()
        {
            string xAxisValue = "";
            string yAxisValue = "0";            
            
            List<Pair<string,string>> result = new List<Pair<string,string>>();                        
            
            XmlDocument xDoc = new XmlDocument(); // initialize xmlDocument object
            xDoc.Load(_xmlUrl); // load xml document from url adress
            XmlNodeList xAxisList = xDoc.GetElementsByTagName(_xAxis); // get nodes which represent x axis
            XmlNodeList yAxisList = xDoc.GetElementsByTagName(_yAxis); // get nodes which represent y axis

            XmlNode xParent = xAxisList.Item(0).ParentNode;
            XmlNode yParent = yAxisList.Item(0).ParentNode;

            if (xParent == yParent)
            {
                XmlNodeList nodeList = xDoc.GetElementsByTagName(xParent.Name);
                foreach (XmlNode node in nodeList)
                {
                    XmlNodeList childNodes = node.ChildNodes;
                    foreach (XmlNode childNode in childNodes)
                    {
                        if (childNode.Name == _xAxis) {
                            xAxisValue = childNode.InnerText;
                        }
                        if (childNode.Name == _yAxis) {
                            yAxisValue = childNode.InnerText;
                        }
                    }
                    Pair<string, string> tuple = new Pair<string, string>();
                    tuple.First = xAxisValue;
                    tuple.Second = yAxisValue;
                    result.Add(tuple);

                    xAxisValue = "";
                    yAxisValue = "0";
                }
            }
            
            return result;
        }        
    }
    public class Pair<T1, T2>
    {
        public T1 First { get; set; }
        public T2 Second { get; set; }
    }
}