using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Web.Script.Serialization;


namespace WebApplication1
{


    public partial class WebAppPage2Predict : System.Web.UI.Page
    {

        public String day_code = null;
        public String location_var = null;
        public String groupValue_var = null;
        public String homeOwnerFlag_var = null;
        public String carAge_var = null;
        public String risk_factor = null;
        public String ageOldest = null;
        public String ageYoungest = null;
        public String marriedFlag = null;
        public String c_Previous_var = null;
        public String durationPrevious_var = null;
        public String hour = null;
        public String isWeekend = null;
        public String isfamily = null;
        public String age_diff = null;
        public String isindividual = null;
        public String statecode = null;
        public String carValueCode = null;
        public String A = null;
        public String B = null;
        public String C = null;
        public String D = null;
        public String E = null;
        public String F = null;
        public String G = null;
        float  cost = 0;
        public String plan = null;
        public float prob_A = 0;
        public float prob_B = 0;
        public float prob_C = 0;
        public float prob_D = 0;
        public float prob_E = 0;
        public float prob_F = 0;
        public float prob_G = 0;
        public float cost_diff = 0;
       


        
        protected void Page_Load(object sender, EventArgs e)
        {
            day_code= Session["day_code"].ToString();
            location_var= Session["location_var"].ToString();
            groupValue_var = Session["groupValue_var"].ToString();
            homeOwnerFlag_var = Session["homeOwnerFlag_var"].ToString();
            carAge_var = Session["carAge_var"].ToString();
            risk_factor = Session["risk_factor"].ToString();
            ageOldest = Session["ageOldest"].ToString();
            ageYoungest = Session["ageYoungest"].ToString();
            marriedFlag = Session["marriedFlag"].ToString();
            c_Previous_var = Session["c_Previous_var"].ToString();
            durationPrevious_var = Session["durationPrevious_var"].ToString();
            hour = Session["hour"].ToString();
            isWeekend = Session["isWeekend"].ToString();
            isfamily = Session["isfamily"].ToString();
            age_diff = Session["age_diff"].ToString();
            isindividual = Session["isindividual"].ToString();
            statecode = Session["statecode"].ToString();
            carValueCode = Session["carValueCode"].ToString();
            A = Session["A"].ToString();
            B = Session["B"].ToString();
            C = Session["C"].ToString();
            D = Session["D"].ToString();
            E = Session["E"].ToString();
            F = Session["F"].ToString();
            G = Session["G"].ToString();
            cost = float.Parse(Session["cost"].ToString());
            cost_diff = float.Parse(Session["costdiff"].ToString());
            prob_A = float.Parse(Session["prob_A"].ToString());
            prob_B = float.Parse(Session["prob_B"].ToString());
            prob_C = float.Parse(Session["prob_C"].ToString());
            prob_D = float.Parse(Session["prob_D"].ToString());
            prob_E = float.Parse(Session["prob_E"].ToString());
            prob_F = float.Parse(Session["prob_F"].ToString());
            prob_G = float.Parse(Session["prob_G"].ToString());

            System.Diagnostics.Debug.WriteLine("!--------PAGE 2 SESSION OBJECTS SET: " + "day_code: " + day_code + " location_var:" +
                       location_var + " groupValue_var.ToString():" +
                       groupValue_var.ToString() + " homeOwnerFlag_var:" +
                       homeOwnerFlag_var + " carAge_var:" +
                       carAge_var + " risk_factor: " +
                       risk_factor + " ageOldest:" +
                       ageOldest + " ageYoungest:" +
                       ageYoungest + " marriedFlag:" +
                       marriedFlag + " c_Previous_var:" +
                       c_Previous_var + " durationPrevious_var:" +
                       durationPrevious_var + " hour:" +
                       hour + " isWeekend:" +
                       isWeekend + " isfamily:" +
                       isfamily + " age_diff:" +
                       age_diff + " isindividual:" +
                       isindividual + " statecode:" +
                       statecode + " carValueCode:" +
                       carValueCode);


            //CHANGING COVERAGE CODES TO STRINGS
            /* if (A == "1") { A = "Gold Plan"; }
             else if (A == "2") { A = "Silver Plan"; }

             if (B == "1") { B = "Gold Plan"; }

             if (C == "1") {C = "Diamond Plan"; }
             else if (C == "2") { C = "Gold Plan"; }
             else if (C == "3") { C = "Silver Plan"; }
             else if (C == "4") { C = "Bronze Plan"; }

             if (D == "1") { D = "Gold Plan"; }
             else if (D == "2") { D = "Silver Plan"; }
             else if (D == "3") { D = "Bronze Plan"; }

             if (E == "1") { E = "Gold Plan"; }

             if (F == "1") { F = "Gold Plan"; }
             else if (F == "2") { F = "Silver Plan"; }
             else if (F == "3") { F = "Bronze Plan"; }

             if (G == "1") { G = "Diamond Plan"; }
             else if (G == "2") { G = "Gold Plan"; }
             else if (G == "3") { G = "Silver Plan"; }
             else if (G == "4") { G = "Bronze Plan"; }
             */


            plan = plan + Environment.NewLine + "Coverage A: " + A +"Confidence Level for A:" + prob_A + Environment.NewLine; 
            plan = plan + Environment.NewLine + "Coverage B: " + B +"Confidence Level for B:" + prob_B + Environment.NewLine; 
            plan = plan + Environment.NewLine + "Coverage C: " + C +"Confidence Level for C:" + prob_C + Environment.NewLine; 
            plan = plan + Environment.NewLine + "Coverage D: " + D +"Confidence Level for D:" + prob_D + Environment.NewLine; 
            plan = plan + Environment.NewLine + "Coverage E: " + E +"Confidence Level for E:" + prob_E + Environment.NewLine; 
            plan = plan + Environment.NewLine + "Coverage F: " + F +"Confidence Level for F:" + prob_F + Environment.NewLine; 
            plan = plan + Environment.NewLine + "Coverage G: " + G +"Confidence Level for G:" + prob_G + Environment.NewLine; 
            //save plan to session
            Session["plan_previous"] = plan;

               

             PredictionResut1.Text = "Coverage A: " + A; Confidence1.Text ="Confidence Level:" + Math.Round(prob_A,2); 
             PredictionResut2.Text = "Coverage B: " + B; Confidence2.Text= "Confidence Level:" + Math.Round(prob_B,2); 
             PredictionResut3.Text = "Coverage C: " + C; Confidence3.Text= "Confidence Level:" + Math.Round(prob_C,2); 
             PredictionResut4.Text = "Coverage D: " + D; Confidence4.Text= "Confidence Level:" + Math.Round(prob_D,2); 
             PredictionResut5.Text = "Coverage E: " + E; Confidence5.Text= "Confidence Level:" + Math.Round(prob_E,2); 
             PredictionResut6.Text = "Coverage F: " + F; Confidence6.Text= "Confidence Level:" + Math.Round(prob_F,2); 
             PredictionResut7.Text = "Coverage G: " + G; Confidence7.Text= "Confidence Level:" + Math.Round(prob_G,2); 


            TotalPriceLabel.Text = "$ "+Math.Round(cost,2);
           // PriceAccuracyLabel.Text = Math.Round(cost_diff, 2).ToString(); 

        }




        protected void purpose_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        public class Rootobject
        {
            public Results Results { get; set; }
        }

        public class Results
        {
            public Output1 output1 { get; set; }
        }

        public class Output1
        {
            public string type { get; set; }
            public Value value { get; set; }
        }

        public class Value
        {
            public string[] ColumnNames { get; set; }
            public string[] ColumnTypes { get; set; }
            public string[][] Values { get; set; }
        }

        public class StringTable
        {
            public string[] ColumnNames { get; set; }
            public string[,] Values { get; set; }
        }

        /*
        //add api
        public async Task InvokeRequestResponseService_Customize(string[] inputparams, Label label)
        {



            System.Diagnostics.Debug.WriteLine("Reached here !");

            using (var client = new HttpClient())
            {
                var scoreRequest = new
                {

                    Inputs = new Dictionary<string, StringTable>() {
                        {
                            "input1",
                            new StringTable()
                            {
                            ColumnNames = new string[] {"location", "group_size", "homeowner", "car_age", "age_oldest", "age_youngest", "married_couple", "state_code", "car_value_code"},
                             //  Values = new string[,] {  { "0", "0", "0", "0", "0", "0", "0", "0", "0" },  { "0", "0", "0", "0", "0", "0", "0", "0", "0" },  }
                                 Values = new string[,] {  { inputparams[0], inputparams[1], inputparams[2] , inputparams[3], inputparams[4], inputparams[5]
                                     ,inputparams[6],inputparams[7],inputparams[8] } }

                            }
                        },
                    },
                    GlobalParameters = new Dictionary<string, string>()
                    {
                    }
                };

                //api key
                const string apiKey = "DufK6tykomTXhbTu8yq/6RhiAOwnu3Xk7WfBoRkoVDV8bYespw/9wHGprNUWpyRwmrnSx7TEZBdK6zvSzRmVDw==";

                //call rest client
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", apiKey);

                //define base address for rest api
                client.BaseAddress = new Uri("https://ussouthcentral.services.azureml.net/workspaces/ae308c93a0db4b72bf3db66d7dd8ec34/services/c76cab6301d0480c99710d97379b2fb5/execute?api-version=2.0&details=true");

                //get the response 
                HttpResponseMessage response = await client.PostAsJsonAsync("", scoreRequest).ConfigureAwait(false);
                System.Diagnostics.Debug.WriteLine("Checking http response!" + response);

                if (response.IsSuccessStatusCode)
                {
                    string result = await response.Content.ReadAsStringAsync();

                    // The following lines were added:
                    JavaScriptSerializer ser = new JavaScriptSerializer();

                    // This deserialization will only work if the corresponding C# classes are defined for JSON.
                    Rootobject myresults = ser.Deserialize<Rootobject>(result);

                    var score = myresults.Results.output1.value.Values; //from C# classes defined above from JSON output

                    string scoredlabels = score[0][0];

                    System.Diagnostics.Debug.WriteLine("Result risk factor" + scoredlabels);

                    Console.WriteLine("Response succeeded!", result);

                    //--API OUTPUT set risk factor
                    risk_factor = scoredlabels;


                }
                else
                {
                    Console.WriteLine(string.Format("The request failed with status code: {0}", response.StatusCode));

                    // Print the headers - they include the requert ID and the timestamp, which are useful for debugging the failure
                    Console.WriteLine(response.Headers.ToString());
                    System.Diagnostics.Debug.WriteLine("Headers!", response.Headers.ToString());

                    string responseContent = await response.Content.ReadAsStringAsync();
                    Console.WriteLine("No success!", responseContent);
                    System.Diagnostics.Debug.WriteLine("No success!", responseContent);
                    if (response == null)
                    {
                        label.Text = response.ToString();
                    }
                    else
                    {
                        label.Text = "No";
                    }
                }
            }

            
        }
        */


        protected void Response_Click(object sender, EventArgs e)
        {

            Response.Redirect("WebAppPage3Customize.aspx", false);
            Context.ApplicationInstance.CompleteRequest();

        }




            //end code here 
        }
}


//string dti = Session["dti"].ToString();