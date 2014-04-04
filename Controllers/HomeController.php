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
        $this->render('home/index.tpl');
    }

    public function processAction($iMaxDepth = 99)
    {
        $this->_view['iMaxLoadCount'] = $iMaxDepth;
        if (isset($this->_params['parameters']) && ! empty($this->_params['parameters'])) {
            $this->process(urldecode($this->_params['parameters']), $iMaxDepth);
        }

        $this->render('home/process.tpl');
    }
}

?>
