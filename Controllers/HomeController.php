<?php

namespace bundles\search\Controllers;

/**
 * ErrorController
 *
 * Manage HTTP error redirection
 *
 * @author niko <nicolasbonnici@gmail.com>
 */
class HomeController extends \Library\Core\Controller {

    /**
     * @todo defined class constant pour http error codes
     */

    public function __preDispatch() {}

    public function __postDispatch() {}

    public function indexAction()
    {
        $this->render('home/index.tpl');
    }

    public function processAction()
    {
        $this->_view['iMaxLoadCount'] = 250;
        if (isset($this->_params['parameters']) && !empty($this->_params['parameters'])) {
            $oSearchModel = new \bundles\search\Models\Search($this->_params['parameters'], array(), array(0, $this->_view['iMaxLoadCount']));
            $this->_view['aResults'] = $oSearchModel->getResults();
        }

        $this->render('home/process.tpl');

    }

}

?>
