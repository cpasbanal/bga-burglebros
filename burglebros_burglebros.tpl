{OVERALL_GAME_HEADER}

<!-- 
--------
-- BGA framework: © Gregory Isabelli <gisabelli@boardgamearena.com> & Emmanuel Colin <ecolin@boardgamearena.com>
-- burglebros implementation : © Brian Gregg baritonehands@gmail.com
-- 
-- This code has been produced on the BGA studio platform for use on http://boardgamearena.com.
-- See http://en.boardgamearena.com/#!doc/Studio for more information.
-------

    burglebros_burglebros.tpl
    
    This is the HTML template of your game.
    
    Everything you are writing in this file will be displayed in the HTML page of your game user interface,
    in the "main game zone" of the screen.
    
    You can use in this template:
    _ variables, with the format {MY_VARIABLE_ELEMENT}.
    _ HTML block, with the BEGIN/END format
    
    See your "view" PHP file to check how to set variables and control blocks
    
    Please REMOVE this comment before publishing your game on BGA
-->

<div id="myhand_wrap" class="whiteblock">
    <h3>{MY_HAND}</h3>
    <div id="myhand">
    </div>
</div>
<div id="temp_display" class="hidden_animated whiteblock">
    <div id="spotter_card_wrapper" class="hidden">
        <h3>{SPOTTER_TITLE}</h3>
        <div id="spotter_card"></div>
    </div>
    <div id="crystal_ball_wrapper" class="hidden">
        <h3>{CRYSTAL_BALL_TITLE}</h3>
        <div id="crystal_ball_cards">
        </div>
    </div>
</div>

<div id="debug">
</div>

<div id="board_wrap">
    <div class="floor_container whiteblock">
        
        <div  class="tiles">
            <!-- BEGIN tiles -->
            <div id="floor{FLOOR}_tiles" class="floor_tiles">
                <h3>Floor {FLOOR}</h3>
                <div class="floor" id="floor{FLOOR}">
                </div>
            </div>
            <!-- END tiles -->
        </div>
        
        <div class="patrols">
            <h3>Patrol</h3>
            <!-- BEGIN patrol -->
            <div class="patrol" id="patrol{FLOOR}">
            </div>
            <!-- END patrol -->
            <div class="floor_preview_container">
                <!-- BEGIN floor_preview -->
                <div class="floor_preview whiteblock" id="floor{FLOOR}_preview">
                    <div class="floor_preview_number whiteblock">{FLOOR}</div>
                    <div class="floor_path_preview" id="floor{FLOOR}_path_preview" ></div>
                </div>
                <!-- END floor_preview -->
            </div>
        </div>
    </div>
</div>

<!-- BEGIN player_hand -->
<div class="player_hand whiteblock">
    <h3 style="color: #{PLAYER_COLOR};">{PLAYER_NAME}</h3>
    <div id="player_hand_{PLAYER_ID}">
    </div>
</div>
<!-- END player_hand -->

<div id="token_container" style="display: none;">
</div>


<script type="text/javascript">

// Javascript HTML templates

/*
// Example:
var jstpl_some_game_item='<div class="my_game_item" id="my_game_item_${MY_ITEM_ID}"></div>';

*/

var jstpl_player_zone = '<div id="player_${id}_tokens" class="player-zone"></div>';

var jstpl_tile_container = '<div id="tile_${id}_container" class="tile-container" style="left: ${x}px; top: ${y}px;" aria-label="${name}">\n' +
'    <div id="tile_${id}_tokens" class="tile-tokens"></div>\n' +
'    <div id="tile_${id}_meeples" class="tile-meeples"></div>\n' +
'    <div id="tile_${id}_cards" class="tile-cards"></div>\n' +
'</div>';

var jstpl_tile = '<div id="tile_${id}" class="tile" style="background-image: url(${bg_image}); background-position: ${bg_position};"></div>';

var jstpl_tile_tooltip = '<div id="tile_${id}_tooltip" class="tile tooltip" style="background-image: url(${bg_image}); background-position: ${bg_position};"></div>';

var jstpl_tile_preview = '<div id="tile_${id}_preview" class="tile-preview ${tile_type}" style="left: ${preview_col}px; top: ${preview_row}px;"></div>'

var jstpl_card_tooltip = '<div class="tooltip_container">\
                                <div id="card_${id}_tooltip" class="card tooltip" style="background-image: url(${bg_image}); background-position: ${bg_position};"></div>\
                                <div class="tooltip_text">\
                                    <div class="tooltip_subhead">${card_subhead}</div>\
                                    <div class="tooltip_title">${card_title}</div>\
                                    <hr/>\
                                    <div class="tooltip_ability">${card_ability}:</div>\
                                    <div class="tooltip_message">${card_tooltip}</div>\
                                </div>\
                            </div>\
                        </div>';
var jstpl_event_card_tooltip = '<div class="tooltip_container">\
                                <div id="card_${id}_tooltip" class="card tooltip" style="background-image: url(${bg_image}); background-position: ${bg_position};"></div>\
                                <div class="tooltip_text">\
                                    <div class="tooltip_title">${card_title}</div>\
                                    <hr/>\
                                    <div class="tooltip_message">${card_tooltip}</div>\
                                </div>\
                            </div>\
                        </div>';
var jstpl_patrol_tooltip = '<div id="patrol_tooltip_${patrol_floor}" class="card tooltip" style="background-image: url(${bg_image}); background-position: ${bg_position}; background-size: 1440px;">${patrol_discards}</div>';

var jstpl_patrol_tooltip_discard = '<div class="patrol-discard" style="left: ${discard_left}px; top: ${discard_top}px; background-image: url(${bg_image});"></div>'

var jstpl_wall = '<div id="wall_${wall_id}" class="wall ${wall_direction}" style="left: ${x}px; top: ${y}px"></div>';

var jstpl_meeple = '<div id="meeple_${meeple_id}" class="meeple" style="background-color: #${player_color}; background-image: url(${meeple_background}); background-position: ${meeple_bg_pos};"></div>';

var jstpl_guard_token = '<div id="guard_token_${token_id}" class="token guard token_guard_wrapper2"></div>';

var jstpl_generic_token = '<div id="generic_token_${token_id}" class="token ${token_type}" style="background-image: url(${token_background}); background-position: -4px ${token_bg_pos}px;"></div>';

var jstpl_card_token = '<div id="card_token_${tile_id}" class="token ${card_type}" style="background-image: url(${token_background});"><div class="token-badge">${card_count}</div></div>';

var jstpl_patrol_die = '<div id="patrol_token_${token_id}" class="token die patrol">${num_spaces}</div>';

var jstpl_safe_die = '<div id="crack_token_${token_id}" class="token die safe">${die_num}</div>';

var jstpl_event_card = '<div id="event_card_dialog${card_id}" class="card ${extra_classes}" style="background-image: url(${bg_image}); background-position: ${bg_position};"></div>'

var jstpl_trade_dialog = '<div id="trade_dialog" class="dialog">\n' +
'    <div class="dialog-content">\n' +
'        <div class="trade-container">\n' +
'            <h3 class="trade-player" style="color: #${p1_color};">${p1_name}</h3>\n' +
'            <div id="trade_p1"></div>\n' +
'        </div>\n' +
'        \n' +
'        <div class="trade-divider">\n' +
'            Click<br>to<br>Swap\n' +
'        </div>\n' +
'        <div class="trade-container">\n' +
'            <h3 class="trade-player" style="color: #${p2_color};">${p2_name}</h3>\n' +
'            <div id="trade_p2"></div>\n' +
'        </div>\n' +
'    </div>\n' +
'    <div class="dialog-footer">\n' +
'        <a href="#" id="trade_cancel_button" class="bgabutton bgabutton_gray">${cancel_title}</a>&nbsp;&nbsp;\n' +
'        <a href="#" id="trade_confirm_button" class="bgabutton bgabutton_blue">${confirm_title}</a>\n' +
'    </div>\n' +
'</div>';

var jstpl_trade_confirmation_dialog = '<div id="trade_dialog" class="dialog">\n' +
'    <div class="dialog-content">\n' +
'        <div class="trade-container">\n' +
'            <h3 class="trade-player" style="color: #${p1_color};">You</h3>\n' +
'            <div id="trade_p1"></div>\n' +
'        </div>\n' +
'        \n' +
'        <div class="trade-divider">\n' +
'            Proposal\n' +
'        </div>\n' +
'        <div class="trade-container">\n' +
'            <h3 class="trade-player" style="color: #${p2_color};">${p2_name}</h3>\n' +
'            <div id="trade_p2"></div>\n' +
'        </div>\n' +
'    </div>\n' +
'    <div class="dialog-footer">\n' +
'        <a href="#" id="trade_cancel_button" class="bgabutton bgabutton_gray">Cancel Trade</a>&nbsp;&nbsp;\n' +
'        <a href="#" id="trade_confirm_button" class="bgabutton bgabutton_blue">Confirm Trade</a>\n' +
'    </div>\n' +
'</div>';

var jstpl_spotter_dialog = '<div id="spotter_dialog" class="dialog">\n' +
'    <div class="dialog-content">\n' +
'        <div id="spotter_card"></div>\n' +
'    </div>\n' +
'    <div class="dialog-footer">\n' +
'        <a href="#" id="spotter_top_button" class="bgabutton bgabutton_gray">Keep on Top</a>&nbsp;&nbsp;\n' +
'        <a href="#" id="spotter_bottom_button" class="bgabutton bgabutton_blue">Put on Bottom</a>\n' +
'    </div>\n' +
'</div>';

var jstpl_draw_tools_dialog = '<div id="draw_tools_dialog" class="dialog">\n' +
'    <div class="dialog-content">\n' +
'        <div id="draw_tools_stock"></div>\n' +
'    </div>\n' +
'    <div class="dialog-footer">\n' +
'        <a href="#" id="draw_tools_discard_button" class="bgabutton bgabutton_blue">Discard Selected</a>\n' +
'    </div>\n' +
'</div>';

var jstpl_die = '<div class="icon_die icon_die_${die_value}" id="${die_id}"></div>';

var jstpl_path_line = '<line id="path_preview_floor${floor}_position${position}" class="path_in" x1=${x1} y1=${y1} x2=${x2} y2=${y2} />';
var jstpl_path_circle = '<circle id="guard_preview_floor${floor}" cx=${cx} cy=${cy} />';
// var jstpl_path_circle = '<circle cx=${cx} cy=${cy}><animate attributeName="x2" attributeType="XML" from="10" to="90" dur="4s" repeatCount="indefinite"/></circle>';
</script>  

{OVERALL_GAME_FOOTER}
