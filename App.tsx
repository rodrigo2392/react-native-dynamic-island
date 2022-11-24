/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

 import React from 'react';
 import {
   SafeAreaView,
   ScrollView,
   StatusBar,
   useColorScheme,
   View,
   NativeModules,
   Button,
 } from 'react-native';
 
 const {DynamicIslandModule} = NativeModules;
 import {Colors, Header} from 'react-native/Libraries/NewAppScreen';
 
 const App = () => {
   const isDarkMode = useColorScheme() === 'dark';
 
   const backgroundStyle = {
     backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
   };
 
 
   return (
     <SafeAreaView style={backgroundStyle}>
       <StatusBar
         barStyle={isDarkMode ? 'light-content' : 'dark-content'}
         backgroundColor={backgroundStyle.backgroundColor}
       />
       <ScrollView
         contentInsetAdjustmentBehavior="automatic"
         style={backgroundStyle}>
         <Header />
         <View
           style={{
             backgroundColor: isDarkMode ? Colors.black : Colors.white,
           }}>
           <Button
             title="Iniciar"
             onPress={() =>
               DynamicIslandModule.startNotificationActivity(
                 'Hola Rodrigo',
                 'Bienvenido',
               )
             }
           />
           <Button
             title="Actualizar actividad"
             onPress={() =>
               DynamicIslandModule.updateNotificationActivity(
                 'Actividad actualizada!',
               )
             }
           />
           <Button
             title="Finalizar"
             onPress={() => DynamicIslandModule.endNotificationActivity()}
           />
         </View>
       </ScrollView>
     </SafeAreaView>
   );
 };
 
 export default App;
 