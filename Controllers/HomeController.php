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
        if ($this->isValidUserLogged()) {
            $this->aView['aEntities'] = \Library\Core\App::buildEntities();
        } else {
            $this->aView['aEntities'] = $this->aEntitiesScope;
        }
        $this->oView->render($this->aView, 'home/index.tpl');
    }

    public function processAction()
    {
        if (isset($this->aParams['parameters']['search'], $this->aParams['parameters']['entities']) && ! empty($this->aParams['parameters']['search'])) {
            $this->process($this->aParams['parameters']['search'], $this->aParams['parameters']['entities']);
        }
    }
}

?>
