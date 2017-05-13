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
    public partial class WebAppPage3Customize : System.Web.UI.Page
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
        public String cost_previous = null;
        public String plan = null;
        public String plan_previous = null;
        public float cost = 0;
        public float cost_diff = 0;




        protected void Page_Load(object sender, EventArgs e)
        {

            
                day_code = Session["day_code"].ToString();
                location_var = Session["location_var"].ToString();
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

                
                Aprev.Text = Session["A"].ToString();
                Bprev.Text = Session["B"].ToString();
                Cprev.Text = Session["C"].ToString();
                Dprev.Text = Session["D"].ToString();
                Eprev.Text = Session["E"].ToString();
                Fprev.Text = Session["F"].ToString();
                Gprev.Text = Session["G"].ToString();

                



                cost_previous = Session["cost"].ToString();
                cost_diff = float.Parse(Session["costdiff"].ToString());

                System.Diagnostics.Debug.WriteLine("!--------PAGE 3 SESSION OBJECTS SET: " + "day_code: " + day_code + " location_var:" +
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


                          plan_previous = Session["plan_previous"].ToString();
                          TotalPriceLabelPrev.Text = "$ " + Math.Round(float.Parse(cost_previous), 2).ToString();

            PredictionResut1.Text = "Coverage A: " + A; 
                            PredictionResut2.Text = "Coverage B: " + B; 
                            PredictionResut3.Text = "Coverage C: " + C; 
                            PredictionResut4.Text = "Coverage D: " + D; 
                            PredictionResut5.Text = "Coverage E: " + E; 
                            PredictionResut6.Text = "Coverage F: " + F; 
                            PredictionResut7.Text = "Coverage G: " + G;
          


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


        //add api
        public async Task InvokeRequestResponseService_Customize(string[] inputparams)
        {



            System.Diagnostics.Debug.WriteLine("Reached here in Customzie api!");

            using (var client = new HttpClient())
            {
                var scoreRequest = new
                {

                    Inputs = new Dictionary<string, StringTable>() {
                        {
                            "input1",
                         new StringTable()
                            {
                        ColumnNames = new string[] {"location", "group_size", "homeowner", "car_age", "risk_factor", "age_oldest", "age_youngest", "married_couple", "A", "B", "C", "D", "E", "F", "G", "state_code", "car_value_code"},
                                    // Values = new string[,] {  { "0", "1", "0", "0", "1", "0", "0", "0", "0", "0", "1", "1", "0", "0", "1", "0", "0" },  { "0", "1", "0", "0", "1", "0", "0", "0", "0", "0", "1", "1", "0", "0", "1", "0", "0" },  }
                              Values = new string[,] {  { inputparams[0], inputparams[1], inputparams[2] , inputparams[3], inputparams[4], inputparams[5]
                                     ,inputparams[6],inputparams[7],inputparams[8],inputparams[9],inputparams[10],inputparams[11],inputparams[12],inputparams[13],
                                    inputparams[14],inputparams[15],inputparams[16]} }

                         }
                               },
                    },
                    GlobalParameters = new Dictionary<string, string>()
                    {
                    }
                };

                //api key
                const string apiKey = "x9Y6x7yVywrDeLiVbn+vyEEuTOP0m6UqtFozkSf9m448UPr6wK/Lw5CUniY09x/ShfPg8qNgz2C4boXrDniYqg==";
               

                //call rest client
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", apiKey);

                //define base address for rest api
                client.BaseAddress = new Uri("https://ussouthcentral.services.azureml.net/workspaces/ae308c93a0db4b72bf3db66d7dd8ec34/services/96ec1f822baf4868bed23c8befe1d263/execute?api-version=2.0&details=true");

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
                    string cost_param = score[0][1];
                    System.Diagnostics.Debug.WriteLine("Result cost PAGE 3 :" + scoredlabels);

                    Console.WriteLine("Response succeeded!", result);

                    //--API OUTPUT set risk factor
                    TotalPriceLabel.Text = "$ "+Math.Round(float.Parse(scoredlabels),2).ToString();
                  //  costParamLabel.Text = Math.Round(float.Parse(cost_param),2).ToString();


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
                   
                }
            }

            
        }


        protected void Response_Click(object sender, EventArgs e)
        {

            //SET AGAIN  
            /*A = QuoteA.Text;
            B = QuoteB.Text;
            C = QuoteC.Text;
            D = QuoteD.Text;
            E = QuoteE.Text;
            F = QuoteF.Text;
            G = QuoteG.Text;
            */

            String a_new = QuoteA.Text;
            String b_new = QuoteB.Text;
            String c_new = QuoteC.Text;
            String d_new = QuoteD.Text;
            String e_new = QuoteE.Text;
            String f_new = QuoteF.Text;
            String g_new = QuoteG.Text;
            

            PredictionResut1new.Text = "New A : " + a_new;
            PredictionResut2new.Text = "New B : " + b_new;
            PredictionResut3new.Text = "New C : " + c_new;
            PredictionResut4new.Text = "New D : " + d_new;
            PredictionResut5new.Text = "New E : " + e_new;
            PredictionResut6new.Text = "New F : " + f_new;
            PredictionResut7new.Text = "New G : " + g_new;




            System.Diagnostics.Debug.WriteLine("Coverages call:" + a_new + "," + b_new + "," +c_new+ "," + d_new + ","  + e_new +","+ f_new + "," + g_new);

            string[] inputparams_predict = new string[] {
                         
                         location_var,
                         groupValue_var.ToString(),
                         homeOwnerFlag_var,
                         carAge_var,
                         risk_factor,
                         ageOldest,
                         ageYoungest,
                         marriedFlag,
                         a_new,
                         b_new,
                         c_new,
                         d_new,
                         e_new,
                         f_new,
                         g_new,
                         statecode,
                         carValueCode

                };

            //call predict api
            InvokeRequestResponseService_Customize(inputparams_predict).Wait();

        }




        //end code 
    }
}