import UIKit

var amplitude = freqTracker.amplitude;
var humanEarPeak = 0.000000000001;
var frequency = freqTracker.frequency;
var customTimer: Timer!
var stackFrame:Double = 0;
var addFrameToSignal:Double = 0;

var helloWorldTimer = Timer.scheduledTimer(timeInterval: 0.001,
                                           target: self,
                                           selector: #selector(frame),
                                           userInfo: nil,
                                           repeats: true)

@objc func frame()
{

func Decibel() -> Double {
    let sum = 10*log10((amplitude/humanEarPeak));
    return sum;
}

if((Decibel()>90 && Decibel()<=120) &&
    (frequency>300 && frequency<=600)){
    stackFrame+=1;
    if(stackFrame > 200){
        addFrameToSignal += 1;
        stackFrame = 0;
        if(addFrameToSignal == 5){
            print("Child cries");
        }
    }
}
if((Decibel()>90) &&
    (frequency>600)){
    print("Something fell")
}
}


print(Decibel());

