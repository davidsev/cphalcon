
/*
 +------------------------------------------------------------------------+
 | Phalcon Framework                                                      |
 +------------------------------------------------------------------------+
 | Copyright (c) 2011-2015 Phalcon Team (http://www.phalconphp.com)       |
 +------------------------------------------------------------------------+
 | This source file is subject to the New BSD License that is bundled     |
 | with this package in the file docs/LICENSE.txt.                        |
 |                                                                        |
 | If you did not receive a copy of the license and are unable to         |
 | obtain it through the world-wide-web, please send an email             |
 | to license@phalconphp.com so we can send you a copy immediately.       |
 +------------------------------------------------------------------------+
 | Authors: Andres Gutierrez <andres@phalconphp.com>                      |
 |          Eduar Carvajal <eduar@phalconphp.com>                         |
 +------------------------------------------------------------------------+
 */

namespace Phalcon\Mvc\Model;

use Phalcon\Mvc\Model\Message;

/**
 * Phalcon\Mvc\Model\Validator
 *
 * This is a base class for Phalcon\Mvc\Model validators
 */
abstract class Validator
{

	protected _options;

	protected _messages = [];

	/**
	 * Phalcon\Mvc\Model\Validator constructor
	 */
	public function __construct(array! options)
	{
		let this->_options = options;
	}

	/**
	 * Appends a message to the validator
	 *
	 * @param string message
	 * @param string|array field
	 * @param string type
	 */
	protected function appendMessage(string! message, field = null, type = null)
	{
		if !type {
			let type = str_replace("Validator", "", get_class(this));
		}
		let this->_messages[] = new Message(message, field, type);
	}

	/**
	 * Returns messages generated by the validator
	 */
	public function getMessages() -> array
	{
		return this->_messages;
	}

	/**
	 * Returns all the options from the validator
	 *
	 * @return array
	 */
	protected function getOptions()
	{
		return this->_options;
	}

	/**
	 * Returns an option
	 *
	 * @param	string option
	 * @return	mixed
	 */
	protected function getOption(string! option)
	{
		var options, value;
		let options = this->_options;
		if fetch value, options[option] {
			return value;
		}
		return "";
	}

	/**
	 * Check whether a option has been defined in the validator options
	 */
	protected function isSetOption(string! option) -> boolean
	{
		return isset this->_options[option];
	}

}