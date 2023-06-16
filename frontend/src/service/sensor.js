export async function getRecords(address) {
  const res = await fetch(`/api/v1/sensors/${address}/records`, {
    credentials: "include",
  });

  if (res.status !== 200) throw new Error("no data");

  const { meta, data } = await res.json();
  return { meta, data };
}

export async function getImage(address) {
  const res = await fetch(`/api/v1/sensors/${address}/live.jpeg`, {
    credentials: "include",
  });

  if (res.status !== 200) throw new Error("no data");

  const lastModified = Date.parse(res.headers.get("last-modified"));

  const blob = await res.blob();

  return { lastModified, blob };
}
