using System.ServiceModel;

namespace CalorieCounter
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface ICalorieCounter
    {

        [OperationContract]
        string GetCalories(string recipe);

        [OperationContract]
        string GetNutrients(string recipe);

    }
}
