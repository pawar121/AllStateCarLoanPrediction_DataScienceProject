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
    public partial class WebFormTest : System.Web.UI.Page
    {

        public String year = DateTime.Now.Year.ToString();
        public String day = DateTime.Now.Day.ToString();
        public String hour = DateTime.Now.Hour.ToString();

        public String location_var = null;
        public String homeownerYesNo = null;
        public String carAge_var = null;
        public String c_Previous_var = null;
        public String durationPrevious_var = null;
        public String state_var = null;
        public String carValue_var = null;
        public String married_var = null;
        public int groupValue_var = 0;
        public String errors = null;
        public int errorFlag = 0;
        public String homeOwnerFlag_var = null;
        public String marriedFlag = null;
        public String ageOldest = null;
        public String ageYoungest = null;
        public String age_var = null;
        public String statecode = null;
        public String carValueCode = null;

        public String risk_factor = null;
        protected void Page_Load(object sender, EventArgs e)
        {

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



        public async Task InvokeRequestResponseService_RiskFactor(string[] inputparams, Label label)
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
                            ColumnNames = new string[] {"location", "group_size", "homeowner", "car_age", "age_oldest", "age_youngest",
                                "married_couple", "state_code", "car_value_code"},
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
                    System.Diagnostics.Debug.WriteLine("Result risk factor"+ scoredlabels);
               
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

        //call first quote rest api
        public async Task InvokeRequestResponseService_Predict(string[] inputparams, Label label)
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
                                 ColumnNames = new string[] {"day", "location", "group_size", "homeowner", "car_age", "risk_factor",
                                    "age_oldest", "age_youngest", "married_couple", "C_previous", "duration_previous", "hour",
                                     "is_weekend", "is_family", "agediff", "is_individual", "state_code", "car_value_code"},
                               // Values = new string[,] {  { "0", "0", "1", "0", "0", "1", "0", "0", "0", "1", "0", "0", "0", "0", "0", "0", "0", "0" },  { "0", "0", "1", "0", "0", "1", "0", "0", "0", "1", "0", "0", "0", "0", "0", "0", "0", "0" },  }
                                Values = new string[,] {  { inputparams[0], inputparams[1], inputparams[2] , inputparams[3], inputparams[4], inputparams[5]
                                     ,inputparams[6],inputparams[7],inputparams[8],inputparams[9],inputparams[10],inputparams[11],inputparams[12],inputparams[13],
                                    inputparams[14],inputparams[15],inputparams[16],inputparams[17]} }
                                    
                            }
                        },
                    },
                    GlobalParameters = new Dictionary<string, string>()
                    {
                    }
                };

                //api key
                const string apiKey = "ne10tkEbPiExPSuNF8hH+I+zv7FlcbxXKPgDcDyprzI9kKn1aIw+4F9IcE+DmKbgx2Km4O5dXJ3txDUOiEPFiA==";
               
                      //call rest client
                      client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", apiKey);

                //define base address for rest api
                client.BaseAddress = new Uri("https://ussouthcentral.services.azureml.net/workspaces/ae308c93a0db4b72bf3db66d7dd8ec34/services/e29f418535284b0d9385640349043ea7/execute?api-version=2.0&details=true");

                //get the response 
                HttpResponseMessage response = await client.PostAsJsonAsync("", scoreRequest).ConfigureAwait(false);
                System.Diagnostics.Debug.WriteLine("Checking http response!" + response);

                if (response.IsSuccessStatusCode)
                {
                    string result = await response.Content.ReadAsStringAsync();
                    System.Diagnostics.Debug.WriteLine("Result!", result);

                    // The following lines were added:
                    JavaScriptSerializer ser = new JavaScriptSerializer();

                    // This deserialization will only work if the corresponding C# classes are defined for JSON.
                    Rootobject myresults = ser.Deserialize<Rootobject>(result);


                    var score = myresults.Results.output1.value.Values; //from C# classes defined above from JSON output

                    string scoredlabels = score[0][0];

                    String E = score[0][0];
                    String C = score[0][1];
                    String B = score[0][2];
                    String D = score[0][3];
                    String A = score[0][4];
                    String F = score[0][5];
                    String G = score[0][6];
                    String cost  = score[0][7];
                    String costdiff = score[0][8];
                    String prob_G = score[0][9];
                    String prob_F = score[0][10];
                    String prob_A = score[0][11];
                    String prob_D = score[0][12];
                    String prob_B = score[0][13];
                    String prob_C = score[0][14];
                    String prob_E = score[0][15];

  

                    System.Diagnostics.Debug.WriteLine("API RESPONSE a:"+A+" B"+B+" C"+C+" D"+D+" E"+E+" F"+F+" G"+G+" COST"+cost+"cost change"+costdiff
                        +"pG"+prob_G);
                    
                    //  string scoredprobabilities = score[0][1];
                    //label.Text = scoredlabels == "1" ? "Interest Rate will be: " : "Sorry your loan cannot be approved!";
                    // label.Text="Yes";
                    Console.WriteLine("Response succeeded!", result);

                    //--API OUTPUT 
                    Session["A"] = A;
                    Session["B"] = B;
                    Session["C"] = C;
                    Session["D"] = D;
                    Session["E"] = E;
                    Session["F"] = F;
                    Session["G"] = G;
                    Session["cost"] = cost;
                    Session["costdiff"] = costdiff;
                    Session["prob_G"] =prob_G;
                    Session["prob_A"] =prob_A;
                    Session["prob_B"] =prob_B;
                    Session["prob_C"] =prob_C;
                    Session["prob_D"] =prob_D;
                    Session["prob_E"] =prob_E;
                    Session["prob_F"] = prob_F;
                

                    Response.Redirect("WebAppPage2Predict.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();

                    /*
                    //CALL PREDICTION FUNCTIONS IF LOAN IS GRANTED 
                    if (scoredlabels == "1")
                    {
                        //result for random forest prediction 
                        classification_result = 1;

                        Session["creditScore"] = credit_score_code.ToString();
                        Session["dti"] = dti.Text;
                        Session["year"] = year;
                        Session["loanAmount"] = loanAmount.Text;
                        Session["state"] = state.Text;
                        Session["emp_length"] = emp_length.Text;

                        Response.Redirect("InterestRate.aspx", false);
                        Context.ApplicationInstance.CompleteRequest();
                        
                    }
                    else
                    {
                        label.Text = "Sorry your loan cannot be approved!";

                    }
                    */

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




        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Text = "here";

            //check for null intpus 
            if (Location.Text != null && HomeownerFlag.Text != null && CarAge.Text != null && C_Previous.Text != null
                && DurationPrevious.Text != null && State.Text != null && CarValue.Text != null && Married.Text != null
                && GroupValue.Text != null)
            {

                location_var = Location.Text;
                homeownerYesNo = HomeownerFlag.Text;
                carAge_var = CarAge.Text;
                c_Previous_var = C_Previous.Text;
                durationPrevious_var = DurationPrevious.Text;
                state_var = State.Text;
                carValue_var = CarValue.Text;
                married_var = Married.Text;
                groupValue_var = int.Parse(GroupValue.Text);
                errors = null;
                errorFlag = 0;


                //convert homeowner flag to category
                if (homeownerYesNo == "Yes") { homeOwnerFlag_var = "1"; } else { homeOwnerFlag_var = "0"; }

                //convert married flag to category
                if (married_var == "Yes") { marriedFlag = "1"; } else { marriedFlag = "0"; }


                //set age_oldest - age_youngest by group value
                if (groupValue_var > 1)
                {
                    ageOldest = MaxAge.Text;
                    ageYoungest = MinAge.Text;
                }
                else
                {
                    ageOldest = Age.Text;
                    ageYoungest = Age.Text;
                }


                //converting state to statecodes
                if (state_var == "AL") { statecode = "0"; }
                else if (state_var == "AR") { statecode = "1"; }
                else if (state_var == "CO") { statecode = "2"; }
                else if (state_var == "CT") { statecode = "3"; }
                else if (state_var == "DC") { statecode = "4"; }
                else if (state_var == "DE") { statecode = "5"; }
                else if (state_var == "FL") { statecode = "6"; }
                else if (state_var == "GA") { statecode = "7"; }
                else if (state_var == "IA") { statecode = "8"; }
                else if (state_var == "ID") { statecode = "9"; }
                else if (state_var == "IN") { statecode = "10"; }
                else if (state_var == "KS") { statecode = "11"; }
                else if (state_var == "KY") { statecode = "12"; }
                else if (state_var == "MD") { statecode = "13"; }
                else if (state_var == "ME") { statecode = "14"; }
                else if (state_var == "MO") { statecode = "15"; }
                else if (state_var == "MS") { statecode = "16"; }
                else if (state_var == "MT") { statecode = "17"; }
                else if (state_var == "ND") { statecode = "18"; }
                else if (state_var == "NE") { statecode = "19"; }
                else if (state_var == "NH") { statecode = "20"; }
                else if (state_var == "NM") { statecode = "21"; }
                else if (state_var == "NV") { statecode = "22"; }
                else if (state_var == "NY") { statecode = "23"; }
                else if (state_var == "OH") { statecode = "24"; }
                else if (state_var == "OK") { statecode = "25"; }
                else if (state_var == "OR") { statecode = "26"; }
                else if (state_var == "PA") { statecode = "27"; }
                else if (state_var == "RI") { statecode = "28"; }
                else if (state_var == "SD") { statecode = "29"; }
                else if (state_var == "TN") { statecode = "30"; }
                else if (state_var == "UT") { statecode = "31"; }
                else if (state_var == "WA") { statecode = "32"; }
                else if (state_var == "WI") { statecode = "33"; }
                else if (state_var == "WV") { statecode = "34"; }
                else if (state_var == "WY") { statecode = "35"; }

                //convert car value codes 
                if (carValue_var == "Less than $30,000") { carValueCode = "0"; }//a
                else if (carValue_var == "Between $30,000 and $40,000") { carValueCode = "1"; }//b
                else if (carValue_var == "Between $40,000 and $50,000") { carValueCode = "2"; }//c
                else if (carValue_var == "Between $50,000 and $60,000") { carValueCode = "3"; }//d
                else if (carValue_var == "Between $60,000 and $70,000") { carValueCode = "4"; }//e
                else if (carValue_var == "Between $70,000 and $80,000") { carValueCode = "5"; }//f
                else if (carValue_var == "Between $80,000 and $90,000") { carValueCode = "6"; }//g
                else if (carValue_var == "Between $90,000 and $100,000") { carValueCode = "7"; }//h
                else if (carValue_var == "More than $110,000") { carValueCode = "8"; }//i
                else { carValueCode = "9"; }


                ///convert day codes
                String day_code = null;
                if (day == "Monday") { day_code = "0"; }
                else if (day == "Tuesday") { day_code = "1"; }
                else if (day == "Wednesday") { day_code = "2"; }
                else if (day == "Thursday") { day_code = "3"; }
                else if (day == "Friday") { day_code = "4"; }
                else if (day == "Saturday") { day_code = "5"; }
                else { day_code = "6"; }

                //checking for min values --VALIDATIONS
                if (ageOldest == "0") { errorFlag = 1; errors = errors + Environment.NewLine + "Age Oldest cannot be zero!"; }
                else if (ageYoungest == "0") { errorFlag = 1; errors = errors + Environment.NewLine + "Age Youngest cannot be zero!"; }
                else if (groupValue_var == 0) { errorFlag = 1; errors = errors + Environment.NewLine + "Group value cannot be zero !"; }


                //is weekend
                String isWeekend = null;
                if (day == "Saturday" || day == "Sunday") { isWeekend = "1"; } else { isWeekend = "0"; };

                //isfamily
                String isfamily = "0";
                if (groupValue_var > 1) { isfamily = "1"; }

                //age diff
                String age_diff = (int.Parse(ageOldest) -int.Parse(ageYoungest)).ToString();

                //is individual
                String isindividual = "1";
                if (groupValue_var > 1) { isindividual = "0"; }

                //if errors encountered display errors in text area
                if (errorFlag == 1)
                {
                    DisplayErrorsLabel.Text = errors;
                }
                else
                {
                    //print 
                    System.Diagnostics.Debug.WriteLine("input predict:" + day_code + "," +
                         location_var + "," +
                         groupValue_var.ToString() + "," +
                         homeOwnerFlag_var + "," +
                         carAge_var + "," +
                         risk_factor + "," +
                         ageOldest + "," +
                         ageYoungest + "," +
                         marriedFlag + "," +
                         c_Previous_var + "," +
                         durationPrevious_var + "," +
                         hour + "," +
                         isWeekend + "," +
                         isfamily + "," +
                         age_diff + "," +
                         isindividual + "," +
                         statecode + "," +
                         carValueCode);

                    //print 

                    System.Diagnostics.Debug.WriteLine("input risk: " + location_var + "," +
                         groupValue_var.ToString() + "," +
                         homeOwnerFlag_var + "," +
                         carAge_var + "," +
                         ageOldest + "," +
                         ageYoungest + "," +
                         marriedFlag + "," +
                         statecode + "," +
                         carValueCode);


                    //converting car value to car value code
                    //System.Diagnostics.Debug.WriteLine("Year is :  " + year);
                    //defining input params to classify coverages 
                    string[] inputparams_coverages = new string[] {
                         location_var,
                         groupValue_var.ToString(),
                         homeOwnerFlag_var,
                         carAge_var,
                         ageOldest,
                         ageYoungest,
                         marriedFlag,
                         statecode,
                         carValueCode

                };

                    //call risk factor api if risk factor is not null
                    InvokeRequestResponseService_RiskFactor(inputparams_coverages, Label1).Wait();

                    if (risk_factor != null) { 

                    string[] inputparams_predict = new string[] {
                         day_code,
                         location_var,
                         groupValue_var.ToString(),
                         homeOwnerFlag_var,
                         carAge_var,
                         risk_factor,
                         ageOldest,
                         ageYoungest,
                         marriedFlag,
                         c_Previous_var,
                         durationPrevious_var,
                         hour,
                         isWeekend,
                         isfamily,
                         age_diff,
                         isindividual,
                         statecode,
                         carValueCode

                };

                        //set session variables 
                        Session["day_code"] = day_code;
                        Session["location_var"] = location_var;
                        Session["groupValue_var"] = groupValue_var;
                        Session["homeOwnerFlag_var"] = homeOwnerFlag_var;
                        Session["carAge_var"] = carAge_var;
                        Session["risk_factor"] = risk_factor;
                        Session["ageOldest"] = ageOldest;
                        Session["ageYoungest"] = ageYoungest;
                        Session["marriedFlag"] = marriedFlag;
                        Session["c_Previous_var"] = c_Previous_var;
                        Session["durationPrevious_var"] = durationPrevious_var;
                        Session["hour"] = hour;
                        Session["isWeekend"] = isWeekend;
                        Session["isfamily"] = isfamily;
                        Session["age_diff"] = age_diff;
                        Session["isindividual"] = isindividual;
                        Session["statecode"] = statecode;
                        Session["carValueCode"] = carValueCode;

                        System.Diagnostics.Debug.WriteLine("!--------PAGE 1 SESSION OBJECTS SET: "+ "day_code: " + day_code + " location_var:" +
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

                        //call predict api
                        InvokeRequestResponseService_Predict(inputparams_predict, Label1).Wait();

                }
                }


            }
            else
            {
                Label1.Text = "Please enter all the fields!";
            }


        }


        //end of partial class Allstatehome
    }
}