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
        $this->aView['aEntities'] = \Library\Core\App::buildEntities();
        $this->oView->render($this->aView, 'home/index.tpl');
    }

    public function processAction()
    {
        if (isset($this->aParams['parameters']) && ! empty($this->aParams['parameters'])) {
            $this->process(urldecode($this->aParams['parameters']));
        }
    }
}

?>
