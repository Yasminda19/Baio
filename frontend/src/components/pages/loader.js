import { getRecords, getSensorList, getSensor } from "../../service/sensor";

export async function sensorListLoader() {
  try {
    const data = await getSensorList();
    return data;
  } catch {
    return [];
  }
}

export async function sensorLoader({ params }) {
  try {
    const { data } = await getRecords(params.address);
    const { name } = await getSensor(params.address);
    return { name, records: data };
  } catch {
    return { name: "", records: [] };
  }
}
