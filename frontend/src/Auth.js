import * as React from "react";
import { useLocation, Navigate } from "react-router-dom";

import AuthService from "./service/auth";

let AuthContext = React.createContext(null);

function AuthProvider({ children }) {
  const [user, setUser] = React.useState(null);

  const signin = (newUser, callback) => {
    return AuthService.signIn(() => {
      setUser(newUser);
      callback();
    });
  };

  const signout = (callback) => {
    return AuthService.signOut(() => {
      setUser(null);
      callback();
    });
  };

  return <AuthContext.Provider value={{user, signin, signout}}>{children}</AuthContext.Provider>;
}

function useAuth() {
  return React.useContext(AuthContext);
}

function RequireAuth({ children }) {
  let auth = useAuth();
  let location = useLocation();

  if (!auth.user) {
    return <Navigate to="/login" state={{ from: location }} replace />;
  }

  return children;
}

export { AuthProvider, useAuth, RequireAuth };
