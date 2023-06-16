import { getRecords } from "../../service/sensor";

export async function sensorLoader({ params }) {
  try {
    const { data } = await getRecords(params.address);
    return { data };
  } catch {
    return { data: [] };
  }
}
