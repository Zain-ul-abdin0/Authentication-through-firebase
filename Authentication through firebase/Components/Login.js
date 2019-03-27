import React  from 'react';
import {StyleSheet,Text,View,Alert} from 'react-native'
import {Container ,Content,Header,Form,Input,Item,Button,Label,} from 'native-base'
import * as firebase from 'firebase'
const firebaseConfig = {
  apiKey: "AIzaSyDF9ehDuZUqJvCkTEs6hyuyCFDX1UT2QbE",
  authDomain: "fir-922a4.firebaseapp.com",
  databaseURL: "https://fir-922a4.firebaseio.com",
  projectId: "fir-922a4",
  storageBucket: "fir-922a4.appspot.com",
  messagingSenderId: "398697382917"
};
firebase.initializeApp(firebaseConfig);




export default class Login extends React.Component {

  constructor(props){
    super(props)

    this.state=({
      email:'',
      password:'',
    })
  }

  signUp=(email,password) =>{

    try {
      if(this.state.password.length<6){
        alert ("Please enter atleast 6 characters")
      }
      firebase.auth().createUserWithEmailAndPassword(email,password)
      } 
        catch (error) {
      console.log(error.toString())
    }
  }


  logIn=(email,password) =>{
  
        firebase.auth().signInWithEmailAndPassword(email, password).catch(function(error) {
          Alert.alert("Your enter woring passs")

        });
this.props.navigation.navigate('Signup')        
  }

  render() {
    return (
       <Container style={styles.container}>
         <Form>
           <Item floatingLabel>
           <Label>Email</Label>
             <Input
             autoCorrect={false}
             autoCapitalize="none"
             onChangeText={(email)=>this.setState({email})}  
             />
           </Item>
           
           <Item floatingLabel>
             <Label>Passwrod</Label>
             <Input
              secureTextEntry={true}
              autoCorrect={false}
              autoCapitalize="none"
              onChangeText={(password)=>this.setState({password})}  

             />
           </Item>
            <View style={{margin:10}}>  
                     <Button styles={{marginTop:'20'}}
            
               full
               rounded
               warning

               onPress={()=>this.logIn(this.state.email,this.state.password)}
               
            >
            <Text style={{color:"#fff",fontWeight:'500'}}>LogIn</Text>

           </Button>
           </View>

          <View style={{marginTop:0}}>
           <Button 
            
            onPress={()=>this.signUp(this.state.email,this.state.password)}
            full
            rounded
            primary
            
            
         >
         <Text style={{color:"#fff",fontWeight:'500'}}>Sign Up</Text>
        </Button>
       </View>

        
   
         </Form>
       </Container>
    );
  }
}

const styles=StyleSheet.create({
container :{
  flex:1,
   backgroundColor:'#fff',
   justifyContent :'center',
   padding:10 
},


});