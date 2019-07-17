import React, { Component } from 'react';
import { View, Text ,Image, StyleSheet ,ImageBackground,Alert} from 'react-native';
import {  Item, Input, Label, Form, Content } from 'native-base';
import * as Animatable from 'react-native-animatable';
import Activity from '../../components/Activity'
import { LinearGradient } from 'expo';
import { TouchableOpacity } from 'react-native-gesture-handler';

class Login extends Component {

  componentDidMount(){
    this.bounce()
  }
  
  handleViewRef = ref => this.view = ref;
  
  bounce = () => this.view.zoomIn(1500).then(endState => console.log(endState.finished ? 'bounce finished' : 'bounce cancelled'));
  
 
  constructor(props) {
    super(props);
    this.state = {
       email:'',
       password:'',
       isLoading:0
    };
  }
//Login function
logIn=async(email,password) =>{
  this.setState({isLoading:1})   
 await  Firebase.auth().signInWithEmailAndPassword(email, password).then(this.onSuccess.bind(this)).catch(function(error) {
   
    Alert.alert(error.toString())

  });
  this.setState({isLoading:0})          

}

onSuccess=()=>{
this.props.navigation.navigate('Splash')    
this.setState({isLoading:0})          
}

onButton=()=>{
  if(this.state.isLoading==1){
    return(
        <Activity/>
    );
  }
  else{
    return(
      <TouchableOpacity style={styles.loginBtn} onPress={()=>{this.logIn(this.state.email,this.state.password)}} >
      <View style={styles.centerLogin}>
          <Text style={styles.login}>Login</Text>
          </View>
      </TouchableOpacity>
    );
    }
  }

  render() {
    return (
 
            <ImageBackground source ={require('../../pics/pic.jpg')} style={{height:'100%',width:'100%'}}>
            <View style={styles.container}>
            
          <View style={styles.logo}>
          <Animatable.View ref={this.handleViewRef}>

                <Image source={require('../../pics/logo.png')} style={{height:300,width:300}} />
           </Animatable.View>

           <View style={{width:300,top:-40}}> 
                  <Item floatingLabel style={styles.float}>
                    <Label style={styles.label}>Username</Label>
                    <Input onChangeText={(email)=>this.setState({email})}/>
                  </Item>
                  
                  <View style={{marginTop:30}}>
                  <Item floatingLabel style={styles.float}>
                    <Label style={styles.label}>Password</Label>
                    <Input onChangeText={(password)=>this.setState({password})}/>
                  </Item>
                  </View>
            </View>
            
            
            
                {this.onButton()}
                
                <Text style={styles.forget} onPress={()=>{alert('text wrkoing')}} onPress={()=>{this.props.navigation.navigate('SignUp')}}>Don't have an account?Register</Text>
                
                <Text style={styles.forget} onPress={()=>{alert('text wrkoing')}}>Forgot your password?</Text>
                
          </View>

          
            </View>
          </ImageBackground>
          


    );
  }
}

export default Login;

const styles = StyleSheet.create({
    container :{
        flex:1,
        alignItems:'center'
    },
    logo:{
        flex:1,
        alignItems:'center',
    },
  
    float:{
      borderColor:'black',
      borderWidth:20
    
    },
    label:{
      color:'black',
    },
    login:{
      color:'white',
      fontSize:25,

    },
    loginBtn:{
      width:300.48,height:50,backgroundColor: 'black',borderRadius:10,
      opacity:0.7,
      marginTop:20
             
    },
    centerLogin:{
      
      flex:1,
      alignItems:'center',
      justifyContent:'center',
    },
    forget:{
      color:'black',
      paddingTop:50
    },
  
})


