<?php
/**
 *------
 * BGA framework: © Gregory Isabelli <gisabelli@boardgamearena.com> & Emmanuel Colin <ecolin@boardgamearena.com>
 * burglebros implementation : © <Your name here> <Your email address here>
 *
 * This code has been produced on the BGA studio platform for use on https://boardgamearena.com.
 * See http://en.doc.boardgamearena.com/Studio for more information.
 * -----
 * 
 * burglebros.action.php
 *
 * burglebros main action entry point
 *
 *
 * In this file, you are describing all the methods that can be called from your
 * user interface logic (javascript).
 *       
 * If you define a method "myAction" here, then you can call it from your javascript code with:
 * this.ajaxcall( "/burglebros/burglebros/myAction.html", ...)
 *
 */
  
  
  class action_burglebros extends APP_GameAction
  { 
    // Constructor: please do not modify
   	public function __default()
  	{
  	    if( self::isArg( 'notifwindow') )
  	    {
            $this->view = "common_notifwindow";
  	        $this->viewArgs['table'] = self::getArg( "table", AT_posint, true );
  	    }
  	    else
  	    {
            $this->view = "burglebros_burglebros";
            self::trace( "Complete reinitialization of board game" );
      }
  	} 
  	
  	// TODO: defines your action entry points there
    public function peek() {
      self::setAjaxMode();
      
      $tile_id = self::getArg( "id", AT_posint, true );
      $this->game->peek($tile_id);

      self::ajaxResponse();
    }

    public function move() {
      self::setAjaxMode();
      
      $tile_id = self::getArg( "id", AT_posint, true );
      $this->game->move($tile_id);

      self::ajaxResponse();
    }

    public function addSafeDie() {
      self::setAjaxMode();
      $this->game->addSafeDie();
      self::ajaxResponse();
    }

    public function rollSafeDice() {
      self::setAjaxMode();
      $this->game->rollSafeDice();
      self::ajaxResponse();
    }

    public function hack() {
      self::setAjaxMode();
      $this->game->hack();
      self::ajaxResponse();
    }

    public function playCard() {
      self::setAjaxMode();
      $card_id = self::getArg( "id", AT_posint, true );
      $this->game->playCard($card_id);
      self::ajaxResponse();
    }

    public function selectCardChoice() {
      self::setAjaxMode();
      $selected_type = self::getArg( "selected_type", AT_alphanum, true );
      $selected_id = self::getArg( "selected_id", AT_alphanum, true );
      $this->game->selectCardChoice($selected_type, $selected_id);
      self::ajaxResponse();
    }

    public function cancelCardChoice() {
      self::setAjaxMode();
      $this->game->cancelCardChoice();
      self::ajaxResponse();
    }

    public function pass() {
      self::setAjaxMode();
      $this->game->pass();
      self::ajaxResponse();
    }

    /*
    
    Example:
  	
    public function myAction()
    {
        self::setAjaxMode();     

        // Retrieve arguments
        // Note: these arguments correspond to what has been sent through the javascript "ajaxcall" method
        $arg1 = self::getArg( "myArgument1", AT_posint, true );
        $arg2 = self::getArg( "myArgument2", AT_posint, true );

        // Then, call the appropriate method in your game logic, like "playCard" or "myAction"
        $this->game->myAction( $arg1, $arg2 );

        self::ajaxResponse( );
    }
    
    */

  }
  

