import * as React from "react";

import { AuthContext } from "../auth";

export default function useAuth() {
  return React.useContext(AuthContext);
}
