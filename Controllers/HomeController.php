<?php
namespace bundles\search\Controllers;

/**
 * ErrorController
 *
 * Manage HTTP error redirection
 *
 * @author niko <nicolasbonnici@gmail.com>
 */
class HomeController extends SearchController
{

    /**
     *
     * @todo defined class constant pour http error codes
     */
    public function __preDispatch()
    {}

    public function __postDispatch()
    {}

    public function indexAction()
    {
        $this->oView->render($this->aView, 'home/index.tpl');
    }

    public function processAction($iMaxDepth = 99)
    {
        $this->aView['iMaxLoadCount'] = $iMaxDepth;
        if (isset($this->aParams['parameters']) && ! empty($this->aParams['parameters'])) {
            $this->process(urldecode($this->aParams['parameters']), $iMaxDepth);
        }

        $this->oView->render($this->aView, 'home/process.tpl');
    }
}

?>
