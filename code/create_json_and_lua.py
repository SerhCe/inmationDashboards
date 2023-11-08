from turtle import title
import pandas as pd
from sys import platform
import json

def check_path_ending(n=1):
    df['path_end'] = df.path.str.split('/').str[-n:].str.join('.')
    df['is_end_equal'] = df.tag == df.path_end
    return df[['tag', 'path_end', 'is_end_equal']]

def fill_body(body_template, path=None, id_action=None, box_value=None, description=None, id_value=None, id_text=None, x=None, y=None, h_txt=1, h_traffic=1, fontsize='1.3vw', w=3):
    tup = (path, id_action, box_value, id_action, box_value, id_action, box_value, id_value, 
           id_action, x, w, h_traffic, y + h_txt
    )
    return body_template % tup 

def fill_body_notraffic2(body_template, path=None, id_action=None, box_value=None, description=None, id_value=None, id_text=None, x=None, y=None, h_txt=1, h_traffic=1, fontsize='1.3vw', w=3):
    tup = (path, 
           id_action, box_value, id_action, box_value, id_action, box_value, id_action, box_value, id_value,  
           id_action, x, w, h_traffic, y + h_txt
    )
    return body_template % tup

def fill_titles(skeleton, titles, xtitle_dict):
    title_skeletons = [skeleton % tuple([title, i] + xtitle_dict[title]) for i, title in enumerate(titles)]
    return ',\n'.join(title_skeletons) + ',\n'
    
def add_break_to_vkarton(x):
    return x.replace('V-Karton-Label', '\nV-Karton-Label')

def convert_int(x):
    try:
        return int(x)
    except:
        return 0

if platform == "win32":
    slash = "\\"
else:
    slash = '/'

automatic_width = True
total_w = 24.

# create variables to build JSON script
body_template = open('JSON_body.txt').read()
body_template_inv = open('JSON_body-invertredgreen.txt').read()
body_notraffic_template2 = open('JSON_body_notraffic2.txt').read()
body_linename = open('JSON_body_linename.txt').read()
skeleton_start = open('JSON_skeleton_start.txt').read()
skeleton_title = open('JSON_skeleton_title.txt').read()
skeleton_end = open('JSON_skeleton_end.txt').read()

with open('parameters.json', 'r') as f:
    parameters = json.load(f)


check_endings = False
lines = ['LDEMO']
for line in lines[:]:
    print('#### ', line)
    df = pd.read_excel(f'..{slash}Tag-Lists{slash}Tags{line}.xlsx')
    df['equipment'] = df['equipment'].fillna(method='ffill')
    df = df[~df.path.isna()].reset_index(drop=True)
    try:
        df = df[df.Filter != 'x'].reset_index(drop=True)
    except:
        pass
    masterDataExists = False

    # check in last row of TagList if MasterData exists 
    if df.iloc[-1]['equipment'] == 'MasterData':
        # create variables to build lua scripts
        luaCreateTags_createItems_folder = open('luaCreateTags_createItems_folder.txt').read() #done
        luaCreateTags_createItems_masterData = open('luaCreateTags_createItems_masterData.txt').read() #done
        luaCreateTags_createItems_actionItemFunction = open('luaCreateTags_createItems_actionItemFunction.txt').read() #done
        luaCreateTags_createItems = open('luaCreateTags_createItems.txt').read() #done
        luaCreateTags_setTriggerLinks_functionLocation = open('luaCreateTags_setTriggerLinks_functionLocation.txt').read() #done
        luaCreateTags_setTriggerLinks = open('luaCreateTags_setTriggerLinks.txt').read() #done
        luaCreateTags_skeleton = open('luaCreateTags_skeleton.txt').read() #done

        luaUpdateTags_getVariables_masterData = open('luaUpdateTags_getVariables_masterData.txt').read() #done
        luaUpdateTags_getVariables_tags = open('luaUpdateTags_getVariables_tags.txt').read() #done
        luaUpdateTags_setSensordashboardValues = open('luaUpdateTags_setSensordashboardValues.txt').read() #done
        luaUpdateTags_skeleton = open('luaUpdateTags_skeleton.txt').read() #done
        luaUpdateTags_updateExpectedValues_set = open('luaUpdateTags_updateExpectedValues_set.txt').read() #done
        luaUpdateTags_updateExpectedValues = open('luaUpdateTags_updateExpectedValues.txt').read() #done

        luaBordersBody = open('JSON_body_luaBorders.txt').read()


        luaInmationBase = '/DEMO/InmationBase'
        masterDataExists = True
        updateFunctionName = f'sensordashboardFunction{line}'
        inmationFolderName = f'/sensordashboard{line}/'
        values_luaCreateTags_createItems = ""
        values_luaCreateTags_setTriggerLinks = ""
        
        values_luaUpdateTags_getVariables_tags = ""
        values_luaUpdateTags_setSensordashboardValues = ""
        values_luaUpdateTags_updateExpectedValues = ""


        # get MaterialNo path from last row 
        matNoTag = df.iloc[-1]['path']
        matNodf = pd.read_excel(f'..{slash}MasterData{slash}MasterData{line}.xlsx')

        # remove MasterData row from df
        df.drop(df.tail(1).index,inplace=True)
        column_headers = list(matNodf.columns.values)


        # fill in values for master Data and folder
        luaCreateTags_createItems_folder = luaCreateTags_createItems_folder % (f'/sensordashboard{line}',f'sensordashboard{line}')
        luaCreateTags_createItems_masterData = luaCreateTags_createItems_masterData % (inmationFolderName+'link_MasterData', 'link_MasterData', matNoTag)
        luaUpdateTags_getVariables_masterData = luaUpdateTags_getVariables_masterData % (luaInmationBase+inmationFolderName+'link_MasterData')

        values_luaCreateTags_setTriggerLinks = values_luaCreateTags_setTriggerLinks + luaCreateTags_setTriggerLinks % ('link_MasterData', matNoTag)
        luaCreateTags_setTriggerLinks_functionLocation = luaCreateTags_setTriggerLinks_functionLocation % (f'{inmationFolderName}{updateFunctionName}')

        # Get and write values from MasterData df, keep in mind values in MasterData should be Materialnumber and boolean of expectedValue
        for i in range(len(matNodf)):
            values_luaUpdateTags_updateExpectedValues_set = ""

            for j in column_headers:
                value_set1 = matNodf.loc[i, j]

                values_luaUpdateTags_updateExpectedValues_set = values_luaUpdateTags_updateExpectedValues_set + luaUpdateTags_updateExpectedValues_set % (
                        f'{luaInmationBase}{inmationFolderName}expectedValue_{j}' , value_set1
                        )
                
            values_luaUpdateTags_updateExpectedValues = values_luaUpdateTags_updateExpectedValues + luaUpdateTags_updateExpectedValues % (
                        matNodf.loc[i, "Materialnummer"], values_luaUpdateTags_updateExpectedValues_set
                    )
            
    # make ids out of path_ends trying to make id as short as possible however unique
    for n in range(1, 6):
        df['id_action'] = df.path.str.split('/').str[-n:].str.join('_')

        x = df.id_action.values
        x = [v for v in x if v.lower() not in ['tba', 'n.a.']]
        if len(x) == len(set(x)):
            break
    if len(x) != len(set(x)):
        print(f'n = {n}')
        print(x)
    print(f'n = {n}')
    
    # check if tag is equal to ending of path
    if check_endings:
        if 'tag' in df.columns:
            print(check_path_ending(n=1))
        continue
    
    df['description'] = df['description'].astype(str)
    df['description'] = '\n' + df['description']
    df['description'] = [add_break_to_vkarton(x) for x in df['description'].values]
    titles = df.equipment.drop_duplicates().values
    
    if line == 'EinstellwertueberwachungL09':
        # parameters dict to variables. A bit unclean...
        parameters_line = parameters[line] 
        ncols_dict = parameters_line['ncols']
        w = parameters_line['w']
        h_txt = parameters_line['h_txt']
        h_traffic = parameters_line['h_traffic']
        fontsize = parameters_line['fontsize']
        df['i_sort'] = df.description.str.strip().apply(convert_int)
        df = df.sort_values('i_sort')
    else:
        fontsize = "1.3vw"
        w = 2.5
        h_txt = 0
        h_traffic = 1.8
        ncols_dict = {"Blistermaschine": 2,
                     "Tubenfüller": 1,
                     "Kartonierer": 2,
                     "Bündler": 1,
                     "Endverpacker": 1,
                     "Aggregation": 2
                 }
        if (df.equipment =="Tubenfüller").sum() > 3:
            ncols_dict["Tubenfüller"] = 2

    h = h_traffic + h_txt # height of cell (text cell + traffic light)

    if automatic_width:
        total_ncol = sum([ncols_dict[e] for e in titles])
        n_titles = len(titles)
        #formula: total_w = total_ncol * w + n_titles
        w = (total_w - n_titles) / total_ncol  
    print(w)

    # define structure along x axis based on ncols and widths w of cells
    y0 = 3
    x0_dict = {}
    xtitle_dict = {title: [0, 0] for title in titles}
    x0 = 0
    for e in titles:
        ncol = n
        xstart = x0
        xtitle_dict[e][0] = xstart
        x0_dict[e] = x0
        x0 += w * ncols_dict[e] + 1
        xtitle_dict[e][1] = x0 - xstart
    
    body = []
    i = 0
    for e in titles:
        x0 = x0_dict[e] + 0.5
        ncols = ncols_dict[e]
        body_luaBorders = ""
        
        dfe = df[df.equipment == e]
        X = dfe[['path', 'id_action', 'description']].values
        for j, (path, id_action, description) in enumerate(X):
            i_row, i_col = j // ncols, j % ncols
            x = x0 + i_col * w
            y = y0 + i_row * h
            print(e, x, y, description[1:])

            
            if path.lower() in ['tba', 'n.a.']:
                continue

            elif 'Application/TaT_HMI/TaT_IO/b_TrackingMode' in path:
                b = fill_body_notraffic2(body_notraffic_template2, path=path, id_action=id_action, box_value=description[1:], description=description[1:], 
                             id_value=f'value_{i}', id_text=f'text_{i}', x=x, y=y
                             ,h_txt=h_txt, h_traffic=h_traffic, fontsize=fontsize, w=w
                             )

            else:
                if line == 'EinstellwertueberwachungL09':
                    tmpl = body_template_inv 
                else:
                    tmpl = body_template
                b = fill_body(tmpl, path=path, id_action=id_action, box_value=description[1:], description=description[1:], 
                             id_value=f'value_{i}', id_text=f'text_{i}', x=x, y=y
                             ,h_txt=h_txt, h_traffic=h_traffic, fontsize=fontsize, w=w
                             )
                
            # build lua body
            if masterDataExists:
                values_luaCreateTags_createItems = values_luaCreateTags_createItems + luaCreateTags_createItems % (
                    f'{inmationFolderName}sensordashboard_{description[1:]}', f'sensordashboard_{description[1:]}',
                    f'{inmationFolderName}link_{description[1:]}', f'link_{description[1:]}', path,
                    f'{inmationFolderName}expectedValue_{description[1:]}', f'expectedValue_{description[1:]}'
                    )

                values_luaCreateTags_setTriggerLinks = values_luaCreateTags_setTriggerLinks + luaCreateTags_setTriggerLinks % (
                    f'link_{description[1:]}', f'{path}'
                )

                values_luaUpdateTags_getVariables_tags = values_luaUpdateTags_getVariables_tags + luaUpdateTags_getVariables_tags % (
                    f'{description[1:]}_link'.replace(' ', '_'), f'{inmationFolderName}link_{description[1:]}',
                    f'{description[1:]}_expectedValue'.replace(' ', '_'), f'{inmationFolderName}expectedValue_{description[1:]}'
                )

                values_luaUpdateTags_setSensordashboardValues = values_luaUpdateTags_setSensordashboardValues + luaUpdateTags_setSensordashboardValues % (
                    f'{luaInmationBase}{inmationFolderName}sensordashboard_{description[1:]}',
                    f'{description[1:]}_link'.replace(' ', '_'), f'{description[1:]}_expectedValue'.replace(' ', '_')
                )

                body_luaBorders = luaBordersBody % (
                f'{luaInmationBase}{inmationFolderName}sensordashboard_{description[1:]}', 
                id_action, id_action, id_action, f'luaValue_{i}' 
                )
            b = b + body_luaBorders
            body.append(b)
            i += 1


    if masterDataExists:
        luaUpdateTags_skeleton = luaUpdateTags_skeleton % (
            values_luaUpdateTags_updateExpectedValues, values_luaUpdateTags_setSensordashboardValues,
            luaUpdateTags_getVariables_masterData, values_luaUpdateTags_getVariables_tags,
        )

        luaCreateTags_createItems_actionItemFunction = luaCreateTags_createItems_actionItemFunction % (
            f'{inmationFolderName}{updateFunctionName}', f'{updateFunctionName}',
            luaUpdateTags_skeleton
        )


        luaCreateTags_skeleton = luaCreateTags_skeleton % (luaInmationBase,
            luaCreateTags_createItems_folder, luaCreateTags_createItems_actionItemFunction, luaCreateTags_createItems_masterData,
            values_luaCreateTags_createItems, luaCreateTags_setTriggerLinks_functionLocation, values_luaCreateTags_setTriggerLinks,
        )

        luaCreateTags_skeleton = luaCreateTags_skeleton.replace('ü', 'Ã¼')

        with open(f'..{slash}dashboards{slash}SensorDashboard{line}.lua', 'w') as f:
            f.write(luaCreateTags_skeleton)
        pass

    skeleton_title_out = fill_titles(skeleton_title, titles, xtitle_dict)

    body = ',\n'.join(body)
    if line == 'EinstellwertueberwachungL09':
        out = skeleton_start + skeleton_title_out + body + skeleton_end
    else:
        out = skeleton_start + skeleton_title_out + body + body_linename % line + skeleton_end
    out = out.replace('ü', 'Ã¼')

    with open(f'..{slash}dashboards{slash}SensorDashboard{line}.json', 'w') as f:
        f.write(out)
