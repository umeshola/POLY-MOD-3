pragma circom 2.0.0;

template OR(){
   signal input a;
   signal input b;
   signal output out;
   out <== a+b-a*b;
}

template NOT(){
   signal input in;
   signal output out;
   out <== 1+in-2*in;
}

template AND(){
   signal input a;
   signal input b;
   signal output out;
   out <== a*b;
}

/*POLY PROOF MOD 3 CIRCUIT A=0, B=1*/  

template Multiplier2 () {  

   //input signals
   signal input a;
   signal input b;

   //Gate signals
   signal X;
   signal Y;

   //Output signals
   signal output Q;

   //Component gates
   component andGate = AND();
   component notGate = NOT();
   component orGate = OR();

   //Logic of circuits
   andGate.a <== a;
   andGate.b <== b;
   X <== andGate.out;

   notGate.in <== b;
   Y <== notGate.out;

   orGate.a <== X;
   orGate.b <== Y;
   Q <== orGate.out;

   log("Final Output : ", Q);
}

component main = Multiplier2();