<?php /* $Id: Activity.tpl 1948 2007-02-23 09:49:27Z will $ */ ?>
<?php TemplateUtility::printHeader(__('Activities'), array('js/highlightrows.js', 'js/sweetTitles.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>
        <div id="contents">
            <table width="100%">
                <tr>
                    <td width="3%">
                        <img src="images/activities.gif" width="24" height="24" alt="<?php _e('Activities');?>" style="border: none; margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2><?php _e('Activities');?></h2></td>
                    <td align="right">
                        <?php echo($this->quickLinks); ?>
                    </td>
                </tr>
            </table>

           <p class="note"><?php _e('Recent Activities');?></p>

           <div style="padding-bottom: 5px;"><?php $this->pager->printNavigation(); ?></div>

           <table id="activityTable" class="sortable" width="925" onmouseover="javascript:trackTableHighlight(event)">
                <tr>
                    <th align="left" width="60" nowrap="nowrap">
                        <?php $this->pager->printSortLink('dateCreatedSort', __('Date')); ?>
                    </th>
                    <th align="left" width="18"></th>
                    <th align="left" width="60" nowrap="nowrap">
                        <?php $this->pager->printSortLink('firstName', __('First Name')); ?>
                    </th>
                    <th align="left" width="80" nowrap="nowrap">
                        <?php $this->pager->printSortLink('lastName', __('Last Name')); ?>
                    </th>
                    <th align="left" width="160" nowrap="nowrap">
                        <?php $this->pager->printSortLink('regarding', __('Regarding')); ?>
                    </th>
                    <th align="left" width="80" nowrap="nowrap">
                        <?php $this->pager->printSortLink('typeDescription', __('Activity')); ?>
                    </th>
                    <th align="left" width="280" nowrap="nowrap">
                        <?php $this->pager->printSortLink('notes', __('Notes')); ?>
                    </th>
                    <th align="left" width="65" nowrap="nowrap">
                        <?php $this->pager->printSortLink('enteredByLastName', __('Entered By')); ?>
                    </th>
                </tr>

                <?php foreach ($this->rs as $rowNumber => $activityData): ?>
                    <tr class="<?php TemplateUtility::printAlternatingRowClass($rowNumber); ?>">
                        <td align="left" valign="top" nowrap="nowrap">
                            <?php $this->_($activityData['dateCreated']); ?>
                        </td>

                        <td align="left" valign="top">
                           <img width="16" height="16" src="images/<?php echo($activityData['icon']); ?>" alt="" />
                        </td>

                        <td align="left" valign="top" >
                            <a href="<?php $this->_($activityData['activityURL']); ?>" title="<?php $this->_($activityData['itemInfo']); ?>">
                                <?php $this->_($activityData['firstName']); ?>
                            </a>
                        </td>

                        <td align="left" valign="top" >
                            <a href="<?php $this->_($activityData['activityURL']); ?>" title="<?php $this->_($activityData['itemInfo']); ?>">
                                <?php $this->_($activityData['lastName']); ?>
                            </a>
                        </td>

                        <td align="left" valign="top" id="activityRegarding<?php echo($activityData['activityID']); ?>">
                            <?php echo($activityData['regarding']); ?>
                        </td>

                        <td align="left" valign="top" id="activityType<?php echo($activityData['activityID']); ?>">
                            <?php $this->_($activityData['typeDescription']); ?>
                        </td>

                        <td align="left" valign="top" >
                            <?php echo($activityData['notes']); ?>
                        </td>

                        <td align="left" valign="top">
                            <?php $this->_($activityData['enteredByAbbrName']); ?>
                        </td>
                    </tr>
                <?php endforeach ?>
            </table>
            <?php $this->pager->printNavigation(); ?>
        </div>
    </div>
    <div id="bottomShadow"></div>

<?php TemplateUtility::printFooter(); ?>
