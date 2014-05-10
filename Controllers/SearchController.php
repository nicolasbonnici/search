<?php
namespace bundles\search\Controllers;

/**
 * ErrorController
 *
 * Manage HTTP error redirection
 *
 * @author niko <nicolasbonnici@gmail.com>
 */
class SearchController extends \Library\Core\Controller
{
    /**
     * Restricted entities scope when no user logged
     * If a valid user session is found this array is overwrited by \Library\Core\App::buildEntities()
     * @var array
     */
    protected $aEntitiesScope = array(
    	'FeedItem',
    	'Tag',
    	'Category',
    	'Post'
    );

    /**
     *
     * @todo defined class constant pour http error codes
     */
    public function __preDispatch()
    {}

    public function __postDispatch()
    {}

    /**
     * Perform a search
     *
     * @param string $sSearch
     * @param array $aEntities          Restrict entities scope
     * @param array $aLimit             Array with offset and the limit of the request
     */
    protected function process($sSearch, array $aEntities = array(), $aLimit = array(0, 100))
    {
        $this->aView['iMaxLoadCount'] = $aLimit[1];
        if (isset($sSearch) && ! empty($sSearch)) {
            try {
                $oSearchModel = new \bundles\search\Models\Search(
                    $sSearch,
                    array(),
                    $aLimit,
                    $aEntities,
                    (($this->isValidUserLogged()) ? $this->oUser : null)
                );
                $this->aView['aResults'] = $oSearchModel->getResults();
                $iStatus = \Library\Core\Controller::XHR_STATUS_OK;

            } catch (\bundles\search\Models\SearchModelException $oException) {
                $this->aView['aResults'] = null;
                $iStatus = \Library\Core\Controller::XHR_STATUS_ERROR;
            }
        }
        $this->oView->render($this->aView, 'home/process.tpl', $iStatus);
    }
}
