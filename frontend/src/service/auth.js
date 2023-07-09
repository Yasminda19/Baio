export async function getUser() {
  const res = await fetch(`/api/v1/auth/user`, {
    credentials: "include",
  });

  if (res.status !== 200) return null;

  const data = await res.json();
  return data;
}

export async function login(username, password) {
  const res = await fetch(`/api/v1/auth/login`, {
    credentials: "include",
    method: "POST",
    body: JSON.stringify({ username, password }),
    headers: {
      "content-type": "application/json",
    },
  });

  if (res.status !== 200) throw new Error("invalid credentials");

  const { access_token, token_type } = await res.json();
  return { access_token, token_type };
}
