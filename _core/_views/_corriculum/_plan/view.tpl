{extends file="_core.3col.tpl"}

{block name="asu_center"}

<table cellpadding="0" cellspacing="0" border="0" class="tableBlank">
    <tr>
        <td valign="top" width="80%">
            <p align="center">ИНДИВИДУАЛЬНЫЙ УЧЕБНЫЙ ПЛАН</p>
            <p align="center">подготовки {if $corriculum->qualification !== null}{$corriculum->qualification->getValue()}{/if}</p>
        </td>
        <td valign="top">
            <p>УТВЕРЖДАЮ и все такое</p>
        </td>
    </tr>
    <tr>
        <td valign="top">
            <p>Направление: {if $corriculum->direction !== null}{$corriculum->direction->getValue()}{/if}</p>
            <p>Профиль: {if $corriculum->profile !== null}{$corriculum->profile->getValue()}{/if}</p>
        </td>
        <td valign="top">
            <p>Квалификация выпускника: {if $corriculum->qualification !== null}{$corriculum->qualification->getValue()}{/if}</p>
            <p>Срок обучения: {$corriculum->duration}</p>
            <p>Форма обучения: {if $corriculum->educationForm !== null}{$corriculum->educationForm->getValue()}{/if}</p>
            <p>Базовое образование: {$corriculum->basic_education}</p>
        </td>
    </tr>
    <tr>
        <td valign="top" colspan="2">
            <table width="100%" cellpadding="0" cellspacing="0" border="1">
                <thead>
                <tr>
                    <td rowspan="2">Цикл</td>
                    <td colspan="3">Дисциплины</td>
                    <td colspan="{$labors->getCount() + 1}">Распределение нагрузки по видям занятий</td>
                    <td>Форма итогового контроля</td>
                </tr>
                <tr>
                    <td>Тип</td>
                    <td>№</td>
                    <td>Наименование дисциплины</td>
                    <td>Всего</td>
                    {foreach $labors->getItems() as $labor}
                        <td>
                            {if !is_null($labor->type)}
                                {$labor->type->getValue()}
                            {/if}
                        </td>
                    {/foreach}
                    <td>&nbsp;</td>
                </tr>
                </thead>
                {foreach $corriculum->cycles->getItems() as $cycle}
                    <tr>
                        <td colspan="{(8 + $labors->getCount())}">
                            <a href="cycles.php?action=edit&id={$cycle->getId()}">{$cycle->title}</a>
                        </td>
                    </tr>
                    {foreach $cycle->disciplines->getItems() as $discipline}
                        <tr>
                            <td>{$cycle->title_abbreviated}</td>
                            <td>&nbsp;</td>
                            <td>{counter}</td>
                            <td>
                                {if !is_null($discipline->discipline)}
                                    <a href="disciplines.php?action=edit&id={$discipline->getId()}">{$discipline->discipline->getValue()}</a>
                                {/if}
                            </td>
                            <!-- Распределение по видам занятий -->
                            <td>{$discipline->getLaborValue()}</td>
                            {foreach $labors->getItems() as $key=>$value}
                            <td>
                                {if !is_null($discipline->getLaborByType($key))}
                                    {$discipline->getLaborByType($key)->value}
                                {/if}
                            </td>
                            {/foreach}
                            <!-- Распределение по видам занятий -->
                        </tr>
                    {/foreach}
                {/foreach}
            </table>
        </td>
    </tr>
</table>
{/block}

{block name="asu_right"}
{include file="_corriculum/_plan/view.right.tpl"}
{/block}