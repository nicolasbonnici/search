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
        $this->_view['iMaxLoadCount'] = $iMaxDepth;
        if (isset($sParameters) && ! empty($sParameters)) {
            $oSearchModel = new \bundles\search\Models\Search($sParameters, array(), array(
                0,
                $iMaxDepth
            ), null, null);
            $this->_view['aResults'] = $oSearchModel->getResults();
        }
        
        $this->render('home/process.tpl');
    }
}
