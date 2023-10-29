import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Int "mo:base/Int";
import Float "mo:base/Float";

actor banking {
  stable var currentValue: Float = 300;
   currentValue := 100;

  Debug.print( debug_show(currentValue));
  stable var startTime = Time.now();
 startTime := Time.now();
  Debug.print(debug_show(startTime));

  public func topUp(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };
    

    public func withdraw(amount: Float)
    {
      let temp: Float = currentValue - amount;
      if(temp >= 0) {
         currentValue -= amount;
         Debug.print(debug_show(currentValue));
      }
      else{
          Debug.print("Amount is too Large! Current Value is less than zero.");
      };
     
    };

    public query func checkBalance(): async Float {
      return currentValue;
    };

    
    public func compound() {
        let currentTime = Time.now();
        let timeElapseNS = currentTime - startTime;
        let timeElapseS = timeElapseNS / 1000000000;
        currentValue := currentValue * (1.01 ** Float.fromInt(timeElapseS));
        startTime := currentTime;
    }
}