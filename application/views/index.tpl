{include file="template_smarty/header.tpl" }

 <div class="Officia-section">
 	 <div class="container">
		 <div class="Officia-section-info">
             <div class="col-md-6 Officia-section-part-1">
                 <h3>Numbers <small>{$type}</small></h3>
                 <div class="row">
                     <form class="form-inline" action="/home/getDataByDate/{$type}" method="post">
                         <div class="form-group col-md-2">
                             <label for="mode">Mode</label>
                             <select class="form-control" name="mode">
                                 <option value="b" {if $strategy.method eq 'b'}selected="selected"{/if}>BBSS</option>
                                 <option value="s" {if $strategy.method eq 's'}selected="selected"{/if}>SSBB</option>
                                 <option value="o" {if $strategy.method eq 'o'}selected="selected"{/if}>OOEE</option>
                                 <option value="e" {if $strategy.method eq 'e'}selected="selected"{/if}>EEOO</option>
                                 <option value="c" {if $strategy.method eq 'c'}selected="selected"{/if}>CCMM</option>
                                 <option value="m" {if $strategy.method eq 'm'}selected="selected"{/if}>MMCC</option>
                             </select>
                         </div>
                         <div class="form-group col-md-3">
                             <label for="times">Times</label>
                             <select class="form-control" name="times">
                                 <option value="1,2,6,15">Steady</option>
                                 <option value="1,2,6,18">Aggressive</option>
                             </select>
                         </div>
                         <div class="form-group col-md-4">
                             <label for="date">Date</label>
                             <input name="date" value="{$date}" class="form_datetime form-control" required="required" type="text" placeholder="{$date}">
                             <script type="text/javascript">
                                 $(".form_datetime").datetimepicker({
                                     format: "yyyy-mm-dd",
                                     autoclose: true,
                                     todayBtn: true,
                                     endDate: new Date(),
                                     minView: 'month'
                                 });
                             </script>
                         </div>
                         <div class="form-group col-md-2">
                             <label for="">&nbsp;</label>
                             <button type="submit" class="btn btn-primary">Submit</button>
                         </div>
                     </form>
                 </div>
                 <br>
                 <div class="row form-group">
                     <form name="dataForm" method="post">
                         <div class="col-md-6 col-xs-12">
                            <h2>{$date}</h2>
                         </div>
                         <input type="hidden" value="{$date}" name="date"/>
                         <input type="hidden" value="{$strategy.method}" name="mode">
                         <div class="col-md-2 col-xs-6">
                             <button class="btn btn-warning" onclick="getPre()" type="submit">Previous</button>
                         </div>
                         <div class="col-md-2 col-xs-6">
                             <button class="btn btn-info pull-right" onclick="getNext()" type="submit" {if $today == $date}disabled="disabled"{/if}>Next</button>
                         </div>
                     </form>
                     <script>
                     {literal}
                         function getPre(){
                     {/literal}
                             document.dataForm.action = "/home/getPreNextData/{$type}/-1";
                             document.dataForm.submit();
                     {literal}
                         }
                         function getNext(){
                     {/literal}
                             document.dataForm.action = "/home/getPreNextData/{$type}/1";
                             document.dataForm.submit();
                     {literal}
                         }
                     {/literal}
                     </script>
                 </div>
                 <br>
                 <div class="row col-md-11">
                     <table class="table table-striped table-bordered table-hover table-condensed">
                         {if $data|@count neq 0}
                         <tr class="warning">
                             <td colspan="2" align="left">MAX-machine</td>
                             {foreach from=['first','second','third','fourth','last'] item=item}
                                 <td>{$data[1][$item]['machine']}</td>
                             {/foreach}
                         </tr>
                         {if $type|mb_substr:2:3 != "ssc"}
                         <tr class="info">
                             <td colspan="2" align="left">MAX-prediction</td>
                             {foreach from=['first','second','third','fourth','last'] item=item}
                                 <td>{$data[1][$item]['prediction']}</td>
                             {/foreach}
                         </tr>
                         {/if}
                         <tr class="success">
                             <td colspan="2" align="left">Current Continued</td>
                             <td>{$data[0][$data[0]|@count-1].first.info.result}</td>
                             <td>{$data[0][$data[0]|@count-1].second.info.result}</td>
                             <td>{$data[0][$data[0]|@count-1].third.info.result}</td>
                             <td>{$data[0][$data[0]|@count-1].fourth.info.result}</td>
                             <td>{$data[0][$data[0]|@count-1].last.info.result}</td>
                         </tr>
                         {/if}
                         <tr>
                             <th>NO.</th>
                             <th>Time</th>
                             <th>1st.</th>
                             <th>2nd.</th>
                             <th>3rd.</th>
                             <th>4th.</th>
                             <th>5th.</th>
                         </tr>
                         {if $data|@count neq 0}
                         {foreach from=$data[0] item=item}
                             <tr>
                                 <td>{$item.num}</td>
                                 <td>{$item.time}</td>
                                 <td class="{if $type|mb_substr:2:3 != "ssc"}{if $item.first.prediction[1] eq 0}danger{/if}{/if}">
                                     <font color="{if $item.first.info.result gt 0}red{else}green{/if}">
                                         {$item.first.num}
                                     </font>
                                     {if $type|mb_substr:2:3 != "ssc"}
                                     (<a href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="Predict Number: {$item.first.prediction[2]}">
                                         {$item.first.prediction[0]}
                                     </a>)
                                     {/if}
                                 </td>
                                 <td class="{if $type|mb_substr:2:3 != "ssc"}{if $item.second.prediction[1] eq 0}danger{/if}{/if}">
                                     <font color="{if $item.second.info.result gt 0}red{else}green{/if}">
                                         {$item.second.num}
                                     </font>
                                     {if $type|mb_substr:2:3 != "ssc"}
                                     (<a href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="Predict Number: {$item.second.prediction[2]}">
                                         {$item.second.prediction[0]}
                                     </a>)
                                     {/if}
                                 </td>
                                 <td class="{if $type|mb_substr:2:3 != "ssc"}{if $item.third.prediction[1] eq 0}danger{/if}{/if}">
                                     <font color="{if $item.third.info.result gt 0}red{else}green{/if}">
                                         {$item.third.num}
                                     </font>
                                     {if $type|mb_substr:2:3 != "ssc"}
                                     (<a href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="Predict Number: {$item.third.prediction[2]}">
                                         {$item.third.prediction[0]}
                                     </a>)
                                     {/if}
                                 </td>
                                 <td class="{if $type|mb_substr:2:3 != "ssc"}{if $item.fourth.prediction[1] eq 0}danger{/if}{/if}">
                                     <font color="{if $item.fourth.info.result gt 0}red{else}green{/if}">
                                         {$item.fourth.num}
                                     </font>
                                     {if $type|mb_substr:2:3 != "ssc"}
                                     (<a href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="Predict Number: {$item.fourth.prediction[2]}">
                                         {$item.fourth.prediction[0]}
                                     </a>)
                                     {/if}
                                 </td>
                                 <td class="{if $type|mb_substr:2:3 != "ssc"}{if $item.last.prediction[1] eq 0}danger{/if}{/if}">
                                     <font color="{if $item.last.info.result gt 0}red{else}green{/if}">
                                         {$item.last.num}
                                     </font>
                                     {if $type|mb_substr:2:3 != "ssc"}
                                     (<a href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="Predict Number: {$item.last.prediction[2]}">
                                         {$item.last.prediction[0]}
                                     </a>)
                                     {/if}
                                 </td>
                            </tr>
                         {/foreach}

                         {else}
                             <tr>
                                 <td colspan="7" align="middle">---- No Data ----</td>
                             </tr>
                         {/if}
                     </table>
                 </div>
             </div>
             <div class="col-md-6 Officia-section-part-2">
                 <h3>Statistics <small>{$type}</small></h3>
             </div>
             <div class="clearfix"> </div>
 	    </div>
    </div>
</div>

{include file="template_smarty/footer.tpl" }

