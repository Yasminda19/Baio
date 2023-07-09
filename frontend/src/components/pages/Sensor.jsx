import PropTypes from "prop-types";
import * as React from "react";

import Box from "@mui/joy/Box";
import Breadcrumbs from "@mui/joy/Breadcrumbs";
import CircularProgress from "@mui/joy/CircularProgress";
import Link from "@mui/joy/Link";
import Sheet from "@mui/joy/Sheet";
import { useColorScheme } from "@mui/joy/styles";
import DataGrid from "react-data-grid";
import { Link as RouterLink, useLoaderData, useParams } from "react-router-dom";
import { ChevronRight } from "react-feather";

import SensorItem from "../SensorItem";

import "react-data-grid/lib/styles.css";
import "../../styles/rdgjoy.css";
import SensorLiveImage from "../SensorLiveImage";

const dateFormatter = new Intl.DateTimeFormat("en-GB", {
  day: "numeric",
  month: "numeric",
  year: "numeric",
  hour: "numeric",
  minute: "numeric",
  second: "numeric",
  timeZoneName: "short",
});

function TimestampFormatter({ timestamp }) {
  return (
    <React.Fragment>{dateFormatter.format(timestamp * 1000)}</React.Fragment>
  );
}

TimestampFormatter.propTypes = {
  timestamp: PropTypes.number.isRequired,
};

const columns = [
  {
    key: "datetime",
    name: "Date/Time",
    sortable: true,
    formatter(props) {
      return <TimestampFormatter timestamp={props.row.datetime} />;
    },
  },
  { key: "heart_rate", name: "Heart Rate" },
  { key: "respiratory_rate", name: "Oxygen Saturation" },
  { key: "temperature", name: "Temperature" },
  { key: "position", name: "Position" },
  { key: "awake_status", name: "Awake Status",formatter(props) {
    return <>{props.row.awake_status ? "BANGUN": "TIDUR"}</>;
  } },
  { key: "health", name: "Overall Health" },
];

function rowKeyGetter(row) {
  return row.id;
}

function getComparator(sortColumn) {
  switch (sortColumn) {
    case "datetime":
      return (a, b) => {
        return a[sortColumn] - b[sortColumn];
      };
    default:
      throw new Error(`unsupported sortColumn: "${sortColumn}"`);
  }
}

export default function Sensor() {
  const { address } = useParams();
  const { name, records } = useLoaderData();

  const { mode } = useColorScheme();

  const [sortColumns, setSortColumns] = React.useState([]);

  const sortedRows = React.useMemo(() => {
    if (sortColumns?.length === 0) return records;

    return [...records].sort((a, b) => {
      for (const sort of sortColumns) {
        const comparator = getComparator(sort.columnKey);
        const compResult = comparator(a, b);
        if (compResult !== 0) {
          return sort.direction === "ASC" ? compResult : -compResult;
        }
      }
      return 0;
    });
  }, [records, sortColumns]);

  return (
    <Sheet
      sx={{
        bgcolor: "background.body",
        flex: 1,
        maxWidth: 1200,
        width: "100%",
        mx: "auto",
      }}
    >
      <Breadcrumbs separator={<ChevronRight />}>
        <Link
          component={RouterLink}
          underline="hover"
          color="neutral"
          fontSize="inherit"
          to="/"
        >
          Sensors
        </Link>
        <Link
          component={RouterLink}
          underline="hover"
          color="neutral"
          fontSize="inherit"
          to={`/sensors/${address}`}
        >
          {address}
        </Link>
      </Breadcrumbs>

      <SensorItem name={name} address={address} isActive />
      <Box sx={{ my: 2 }} />

      <React.Suspense
        fallback={
          <CircularProgress
            size="md"
            sx={{
              position: "relative",
              left: "50%",
            }}
          />
        }
      >
        <DataGrid
          className={`rdg-joy-${mode}`}
          columns={columns}
          sortColumns={sortColumns}
          rows={sortedRows}
          rowKeyGetter={rowKeyGetter}
          rowHeight={50}
          onSortColumnsChange={setSortColumns}
        />
      </React.Suspense>

      <SensorLiveImage address={address} />
    </Sheet>
  );
}
