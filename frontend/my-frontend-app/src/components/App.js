import React, {useState, useEffect} from 'react';
import { BrowserRouter, Route, Routes, Navigate, useNavigate } from "react-router-dom";
import '../styles/App.css';
import Home from './Home'
import Login from './Login'
import ProfilePage from './ProfilePage'
import CreateAccount from './CreateAccount.js'
import UserPage from './UserPage'
import Matches from './Matches'



function App() {

  const [isLoggedIn, setIsLoggedIn] = useState(false)
  let history = useNavigate();

  useEffect(() => {
    let stringValue = "true"; 
    setIsLoggedIn(window.localStorage.getItem('Log In Status') === stringValue);
  }, [])

  useEffect(()=>{
      localStorage.setItem('Log In Status', isLoggedIn)
  },[isLoggedIn])

  function handleLogin(e) {


    e.preventDefault()

    const loginInfo = {
      username: e.target.username.value,
      password: e.target.password.value
    }

      fetch('http://localhost:9292/login', {
        method: 'POST',
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(loginInfo)
      })
      .then(resp => resp.json())
      .then(result => renderLoginState(result))

      function renderLoginState(result) {

        console.log(result)

        let {response, current_user_id} = result

        if (response === 'Success') {
          localStorage.setItem('User ID', current_user_id)
          setIsLoggedIn(true)
        }
        else {
          window.alert(`We couldn't find your account. Please check your password and try again!`)
        }
      }
      
    }

    function handleLogout() {
      setIsLoggedIn(false)
      localStorage.removeItem('User ID')
      history.push("/login")
    }

  return (

      <div className="App">
       <BrowserRouter> 
      <Routes>
      <Route exact path="/login">
        {isLoggedIn ? <Navigate to="/"/> : <Login handleLogin={handleLogin} />}
        </Route>
        <Route exact path="/create-account">
          <CreateAccount />
        </Route>
        <Route exact path="/profile">
          {isLoggedIn ? <ProfilePage handleLogout={handleLogout}/> : <Navigate to="/login"/>}
        </Route>
        <Route exact path="/">
          {isLoggedIn ? <Home /> : <Navigate to="/login"/>}
        </Route>
        <Route exact path="/matches">
          {isLoggedIn ? <Matches /> : <Navigate to="/login"/>}
        </Route>
        <Route path="/:id" children={ isLoggedIn ? <UserPage /> : <Navigate to="/login"/>} />
      </Routes>
      </BrowserRouter>
      </div>

  );
}

export default App;