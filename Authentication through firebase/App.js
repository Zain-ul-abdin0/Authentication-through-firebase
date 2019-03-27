import React , {Component} from 'react';
import {View , Text} from 'react-native';
import Home from './Home'
import {createStackNavigator} from 'react-navigation'
import {Login} from './Components/Login' 
export default class App extends Component {
    
    
    render(){
        return (
            <View>
            <Login/>  
            </View>
            );

        }
    }
