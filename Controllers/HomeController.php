<?php
namespace bundles\search\Controllers;

use bundles\search\Models\SearchModelException;
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
            $this->aView['aEntities'] = $this->aPublicEntitiesScope;
        }
        $this->oView->render($this->aView, 'home/index.tpl');
    }

    public function processAction()
    {
        if (!isset($this->aParams['parameters']['search']) || empty($this->aParams['parameters']['search'])) {
            throw new SearchControllerException('Illegal entity requested', 403);
            exit;
        } else {
            if (isset($this->aParams['parameters']['entities']) && is_array($this->aParams['parameters']['entities']) ) {

                foreach ($this->aParams['parameters']['entities'] as $sEntity) {
                    if (! $this->isValidUserLogged() && ! in_array($sEntity, $this->aPublicEntitiesScope)) {
                        throw new SearchControllerException('Illegal entity requested', 403);
                        exit;
                    }
                }

            } else {
                $this->aParams['parameters']['entities'] = (($this->isValidUserLogged()) ? null : $this->aPublicEntitiesScope);
            }
            $this->process($this->aParams['parameters']['search'], $this->aParams['parameters']['entities']);
        }
    }
}


