import { Button, List, ListItem, ListItemButton, ListItemIcon, ListItemText, Tooltip } from "@mui/material";
import { getGridStringOperators, GridColDef, GridRenderCellParams } from "@mui/x-data-grid";

import DeleteIcon from '@mui/icons-material/Delete';
import EditOutlinedIcon from '@mui/icons-material/EditOutlined';
import LinkIcon from '@mui/icons-material/Link';
import { NavigateFunction } from "react-router";
import moment from "moment";
import { Action, Resource } from "service/model/model";

type DeleteFunc = (params: GridRenderCellParams) => void;

type ListColumnsType = {
  navigate: NavigateFunction
  onDelete?: DeleteFunc
}

export const ListColumns = ({
  navigate,
  onDelete,
}: ListColumnsType): GridColDef[] => [
    {
      field: 'id',
      headerName: 'Name',
      width: 250,
      sortable: true,
      filterable: true,
      filterOperators: getGridStringOperators().filter(
        (operator) => operator.value === 'contains',
      ),
    },
    {
      field: 'resources',
      headerName: 'Resources',
      width: 350,
      sortable: false,
      filterable: false,
      renderCell: (params: GridRenderCellParams) => {
        return (
          <List dense>
            {params.row.resources.map((resource: Resource, index: string) => (
              <ListItemButton key={index} dense component='a' href={`/resources/edit/${resource.id}`}>
                <ListItemIcon>
                  <LinkIcon fontSize='small' color='primary' />
                </ListItemIcon>
                <ListItemText primary={resource.id} />
              </ListItemButton>
            ))}
          </List>
        )
      },
    },
    {
      field: 'actions',
      headerName: 'Actions',
      width: 250,
      sortable: false,
      filterable: false,
      renderCell: (params: GridRenderCellParams) => {
        return (
          <List dense>
            {params.row.actions.map((action: Action, index: string) => (
              <ListItem key={index}>
                <ListItemText primary={action.id} />
              </ListItem>
            ))}
          </List>
        )
      },
    },
    {
      field: 'created_at',
      headerName: 'Creation date',
      width: 150,
      sortable: true,
      filterable: false,
      renderCell: (params: GridRenderCellParams) => {
        if (params.row.created_at.startsWith('0001-01-01')) {
          return (<i>Unknown</i>);
        }

        const date = moment(params.row.created_at);
        return (
          <div title={`${date.format('L')} à ${date.format('LT')}`}>
            {date.fromNow()}
          </div>
        )
      },
    },
    {
      field: 'updated_at',
      headerName: 'Update date',
      width: 150,
      sortable: true,
      filterable: false,
      renderCell: (params: GridRenderCellParams) => {
        if (params.row.updated_at.startsWith('0001-01-01')) {
          return (<i>Unknown</i>);
        }

        const date = moment(params.row.updated_at);
        return (
          <div title={`${date.format('L')} à ${date.format('LT')}`}>
            {date.fromNow()}
          </div>
        )
      },
    },
    {
      field: 'action',
      width: 250,
      type: 'actions',
      headerName: 'Actions',
      renderCell: (params: GridRenderCellParams) => (
        <>
          <Button
            variant='contained'
            size='small'
            color='primary'
            startIcon={(<EditOutlinedIcon />)}
            style={{ marginRight: 10 }}
            onClick={() => navigate('/policies/edit/' + params.row.id)}
          >
            Edit
          </Button>
          
          <Tooltip title='Supprimer' placement='right'>
            <Button
              variant='text'
              size='small'
              color='error'
              onClick={() => {
                if (onDelete !== undefined) {
                  onDelete(params);
                }
              }}
            >
              <DeleteIcon />
            </Button>
          </Tooltip>
        </>
      )
    },
];