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

    public function processAction()
    {
        $this->_view['iMaxLoadCount'] = 250;
        if (isset($this->_params['parameters']) && ! empty($this->_params['parameters'])) {
            $this->process($this->_params['parameters'], 256);
        }
        
        $this->render('home/process.tpl');
    }
}

?>
