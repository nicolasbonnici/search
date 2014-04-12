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

    public function __preDispatch()
    {}

    public function __postDispatch()
    {}

    public function processAction($iMaxDepth = 99)
    {
        $this->aView['iMaxLoadCount'] = $iMaxDepth;
        if (isset($this->aParams['parameters']) && ! empty($this->aParams['parameters'])) {
            $oSearchModel = new \bundles\search\Models\Search(
                urldecode($this->aParams['parameters']),
                array(),
                array(
                0,
                $iMaxDepth
            ), null, ((isset($this->oUser) && $this->oUser->isLoaded()) ? $this->oUser->getId() : null));
            $this->aView['aResults'] = $oSearchModel->getResults();
        }

        $this->oView->render($this->aView, 'home/process.tpl');
    }
}

