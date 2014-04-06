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
     *
     * @todo defined class constant pour http error codes
     */
    public function __preDispatch()
    {}

    public function __postDispatch()
    {}

    protected function process($sParameters, $iMaxDepth = 256)
    {
        $this->aView['iMaxLoadCount'] = $iMaxDepth;
        if (isset($sParameters) && ! empty($sParameters)) {
            // @todo try
            try {
                $oSearchModel = new \bundles\search\Models\Search($sParameters, array(), array(
                    0,
                    $iMaxDepth
                ), 'FeedItem', null);
                $this->aView['aResults'] = $oSearchModel->getResults();
                $iStatus = \Library\Core\Controller::XHR_STATUS_OK;

            } catch (\bundles\search\Models\SearchModelException $oException) {
                $this->aView['aResults'] = null;
                $iStatus = \Library\Core\Controller::XHR_STATUS_ERROR;
            }
        }
        $this->render('home/process.tpl', $iStatus);
    }
}
