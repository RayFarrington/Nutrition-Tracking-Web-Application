using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Text.RegularExpressions;
using System.Web;

namespace CalorieCounter
{
    //class for getting data from api
    public class Nutrient
    {
        [JsonPropertyName("number")]
        public string Number { get; set; }

        [JsonPropertyName("name")]
        public string Name { get; set; }

        [JsonPropertyName("unitName")]
        public string UnitName { get; set; }
    }
    public class FoodNutrient
    {
        [JsonPropertyName("nutrient")]
        public Nutrient Nutrient { get; set; }

        [JsonPropertyName("amount")]
        public double Amount { get; set; }


    }

    public class Food
    {
        [JsonPropertyName("fdcId")]
        public int fdcId { get; set; }
        [JsonPropertyName("description")]
        public string Name { get; set; }

        [JsonPropertyName("foodNutrients")]
        public List<FoodNutrient> foodNutrients { get; set; }

        public double portion { get; set; }
    }

    public class Service1 : ICalorieCounter
    {

        //This service gets data from the USDA to calculate calories and nutrients for a given recipe
        private string url = "https://api.nal.usda.gov/fdc/v1/";
        private string api = ConfigurationManager.AppSettings["ApiKey"];
        public string GetCalories(string recipe)
        {
            //turn the recipe into a dictionary of ingredients and their portions
            string[] recipeArray = recipe.Split(';');
            Dictionary<string, string> ingredients = new Dictionary<string, string>();
            string[] part;
            for (int i = 0; i < recipeArray.Length; i++)
            {
                part = recipeArray[i].Split(',');
                ingredients.Add(part[0], part[1]);
            }
            

            //Create a new URI for the api call
            var builder = new UriBuilder(url + "foods/search");
            var query = HttpUtility.ParseQueryString("");
            query["api_key"] = api;
            query["pageSize"] = "1";


            WebClient client = new WebClient();
            string json;
            List<Food> foods = new List<Food>();
            int index = 0;
            string fdcid;
            double sum = 0;


            foreach (var r in ingredients)
            {
                //first we search the ingredient using foods/search
                query["query"] = r.Key;
                builder.Query = query.ToString();
                json = client.DownloadString(builder.ToString());

                //foods are added to a list 
                foods.Add(new Food());

                //find the fdcID using Regex
                fdcid = Regex.Match(json, "\"fdcId\":([^,]*)").Value.Substring(8);

                //now we use the fdcid to ask for the details of that food, specifically the "ENERGY" value
                //which is nutrient code 208 and gives the amount of kCal per 100g
                json = client.DownloadString(url + "food/" + fdcid + "?format=abridged" + "&nutrients=208" + "&api_key=" + api);
                foods[index] = JsonSerializer.Deserialize<Food>(json);

                //we calculate the kCal in the recipe by div by 100 and multiplying by the portion
                sum += (foods[index].foodNutrients[0].Amount / 100) * double.Parse(r.Value);
                index++;
            }


            return sum.ToString("0");
        }

        public string GetNutrients(string recipe)
        {
            //Nutrients functions similar to the Calorie counter
            string[] recipeArray = recipe.Split(';');
            Dictionary<string, string> ingredients = new Dictionary<string, string>();
            string[] part;
            for (int i = 0; i < recipeArray.Length; i++)
            {
                part = recipeArray[i].Split(',');
                ingredients.Add(part[0], part[1]);
            }

            var builder = new UriBuilder(url + "foods/search");
            var query = HttpUtility.ParseQueryString("");
            query["api_key"] = api;
            query["pageSize"] = "1";

            WebClient client = new WebClient();
            string json;
            List<Food> foods = new List<Food>();
            int index = 0;
            string fdcid;

            foreach (var r in ingredients)
            {
                query["query"] = r.Key;
                builder.Query = query.ToString();
                json = client.DownloadString(builder.ToString());

                foods.Add(new Food());

                fdcid = Regex.Match(json, "\"fdcId\":([^,]*)").Value.Substring(8);

                json = client.DownloadString(url + "food/" + fdcid + "?format=full" + "&api_key=" + api);

                foods[index] = JsonSerializer.Deserialize<Food>(json);

                foods[index].portion = double.Parse(r.Value); //a new portion value is added to the food for later calculation
                index++;
            }

            string rtn = "";
            //for each food the nutrients are printed 
            foreach (var food in foods)
            {
                rtn += food.Name + "\n"; //identify the ingredient
                foreach (var nutrient in food.foodNutrients)
                {
                    if (nutrient.Amount != 0)//check if there are actually any of that nutrient in the food
                    {
                        //print the nutrient, the amount in the portion, and the units
                        rtn += nutrient.Nutrient.Name + ": " + ((nutrient.Amount / 100) * food.portion) + " " + nutrient.Nutrient.UnitName + "\n";
                    }

                }
                rtn += "\n";
            }
            return rtn;
        }
    }
}
