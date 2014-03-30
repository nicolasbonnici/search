<?php

namespace bundles\search\Controllers;

/**
 * search AuthController
 *
 * Perform search that require a valid user session
 *
 * Manage HTTP error redirection
 *
 * @author niko <nicolasbonnici@gmail.com>
 */
class AuthController extends \Library\Core\Auth
{

    public function __preDispatch() {}
    public function __postDispatch() {}

    public function processAction($iMaxDepth = 256)
    {
        $this->_view['iMaxLoadCount'] = $iMaxDepth;
        if (isset($this->_params['parameters']) && !empty($this->_params['parameters'])) {
            $oSearchModel = new \bundles\search\Models\Search(
                    $this->_params['parameters'],
                    array(),
                    array(0, $this->_view['iMaxLoadCount']),
                    null,
                    ((isset($this->oUser) && $this->oUser->isLoaded()) ? $this->oUser->getId() : null)
            );
            $this->_view['aResults'] = $oSearchModel->getResults();
        }

        $this->render('home/process.tpl');
    }
}

