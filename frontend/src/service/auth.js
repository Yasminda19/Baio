const fakeAuthService = {
  signIn(callback) {
    setTimeout(callback, 100);
  },
  signOut(callback) {
    setTimeout(callback, 100); 
  },
};

let authService = fakeAuthService;

export default authService;