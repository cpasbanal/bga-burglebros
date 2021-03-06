<?php
/**
 *------
 * BGA framework: © Gregory Isabelli <gisabelli@boardgamearena.com> & Emmanuel Colin <ecolin@boardgamearena.com>
 * burglebros implementation : © Brian Gregg baritonehands@gmail.com
 *
 * This code has been produced on the BGA studio platform for use on http://boardgamearena.com.
 * See http://en.boardgamearena.com/#!doc/Studio for more information.
 * -----
 *
 * burglebros.view.php
 *
 * This is your "view" file.
 *
 * The method "build_page" below is called each time the game interface is displayed to a player, ie:
 * _ when the game starts
 * _ when a player refreshes the game page (F5)
 *
 * "build_page" method allows you to dynamically modify the HTML generated for the game interface. In
 * particular, you can set here the values of variables elements defined in burglebros_burglebros.tpl (elements
 * like {MY_VARIABLE_ELEMENT}), and insert HTML block elements (also defined in your HTML template file)
 *
 * Note: if the HTML of your game interface is always the same, you don't have to place anything here.
 *
 */
  
  require_once( APP_BASE_PATH."view/common/game.view.php" );
  
  class view_burglebros_burglebros extends game_view
  {
    function getGameName() {
        return "burglebros";
    }    
  	function build_page( $viewArgs )
  	{		
  	    // Get players & players number
        $players = $this->game->loadPlayersBasicInfos();
        $players_nbr = count( $players );

        /*********** Place your code below:  ************/


        /*
        
        // Examples: set the value of some element defined in your tpl file like this: {MY_VARIABLE_ELEMENT}

        // Display a specific number / string
        $this->tpl['MY_VARIABLE_ELEMENT'] = $number_to_display;

        // Display a string to be translated in all languages: 
        $this->tpl['MY_VARIABLE_ELEMENT'] = self::_("A string to be translated");

        // Display some HTML content of your own:
        $this->tpl['MY_VARIABLE_ELEMENT'] = self::raw( $some_html_code );
        
        */
        
        /*
        
        // Example: display a specific HTML block for each player in this game.
        // (note: the block is defined in your .tpl file like this:
        //      <!-- BEGIN myblock --> 
        //          ... my HTML code ...
        //      <!-- END myblock --> 
        

        $this->page->begin_block( "burglebros_burglebros", "myblock" );
        foreach( $players as $player )
        {
            $this->page->insert_block( "myblock", array( 
                                                    "PLAYER_NAME" => $player['player_name'],
                                                    "SOME_VARIABLE" => $some_value
                                                    ...
                                                     ) );
        }
        
        */
        $template = self::getGameName() . "_" . self::getGameName();

        $this->page->begin_block($template, "tiles");
        for ($floor=1; $floor <= 3; $floor++) { 
            $this->page->insert_block("tiles", array ("FLOOR" => $floor));
        }
        $this->page->begin_block($template, "patrol");
        for ($floor=1; $floor <= 3; $floor++) { 
            $this->page->insert_block("patrol", array ("FLOOR" => $floor));
        }
        $this->page->begin_block($template, "floor_preview");
        for ($floor=1; $floor <= 3; $floor++) { 
            $this->page->insert_block("floor_preview", array ("FLOOR" => $floor));
        }

        global $g_user;
        $current_player_id = $g_user->get_id();

        $this->page->begin_block($template, "player_hand");
        foreach ($players as $player_id => $player) {
            if ($player_id != $current_player_id) {
                $this->page->insert_block("player_hand", array (
                    "PLAYER_NAME" => $player['player_name'],
                    "PLAYER_COLOR" => $player['player_color'],
                    "PLAYER_ID" => $player_id
                ));
            }
        }
        // this will make our My Hand text translatable
        $this->tpl['MY_HAND'] = self::_("My hand");
        $this->tpl['CRYSTAL_BALL_TITLE'] = self::_("Reorder the 3 upcoming events (leftmost will be the first to happen). Click on a card to move it.");
        $this->tpl['SPOTTER_TITLE'] = self::_("Spotter: place the card back on top or bottom of the deck");

        /*********** Do not change anything below this line  ************/
  	}
  }
  

